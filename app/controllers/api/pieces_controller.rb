require 'open-uri'

class Api::PiecesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    search_text = params[:search]
    search_min = params[:search_min]
    search_max = params[:search_max]

    case params[:sort]
      when "lowhigh" then @pieces = Piece.where('inventory > 0').order("price asc")
      when "highlow" then @pieces = Piece.where('inventory > 0').order("price desc")
      when "newestfirst" then @pieces = Piece.where('inventory > 0').order("created_at desc")
      when "popular" then @pieces = Piece.where('inventory > 0').order("view_count desc")
      when "nameasc" then @pieces = Piece.where('inventory > 0').order("title asc")
      when "namedesc" then @pieces = Piece.where('inventory > 0').order("title desc")
      else @pieces = Piece.where('inventory > 0').order("view_count desc")
    end

    @pieces = @pieces.search_all(search_text) if search_text.present?
    if search_min.present? && search_max.present?
      @pieces = @pieces.where('? <= price AND price <= ?', search_min, search_max)
    elsif search_min.present?
      @pieces = @pieces.where('? <= price', search_min)
    elsif search_max.present?
      @pieces = @pieces.where('price <= ?', search_max)
    end
    @pieces = @pieces.page(params[:page]).per(48)
    @pieces_count = @pieces.count
  end

  def show
    @piece = Piece.find_by id: params[:id]
  end

  def create
    @piece = Piece.new piece_params
    @piece.artist = @current_user.artist if @current_user.artist

    url = params[:piece][:photo_url]
    if url.present?
      open(url, "rb") do |file|
        @piece.photo = file
      end
    end

    if @piece.save
      render :show
    else
      render json: {errors: @piece.errors}, status: 422
    end
  end

  def update
    @piece = Piece.find_by id: params[:id]

    @piece.artist = @current_user

    url = params[:piece][:photo_url]
    if url.present?
      open(url, "rb") do |file|
        @piece.photo = file
      end
    end

    if @piece.update piece_params
      render :show
    else
      render json: {errors: @piece.errors}, status: 422
    end

  end

  def destroy
    @piece = Piece.find_by id: params[:id]
    if @piece.artist = @current_user
      @piece.destroy
      head :ok
    end
  end

  def piece_params
    params.require(:piece).permit(:title, :price, :inventory, :description, :photo, :artist_id)
  end

end
