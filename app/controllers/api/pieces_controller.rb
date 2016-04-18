require 'open-uri'

class Api::PiecesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @categories = Category.all.order("name asc")
    @pieces = Piece.all

    case params[:sort]
    when "lowhigh" then @pieces = @pieces.where('inventory > 0').order("price asc")
      when "highlow" then @pieces = @pieces.where('inventory > 0').order("price desc")
      when "newestfirst" then @pieces = @pieces.where('inventory > 0').order("created_at desc")
      when "popular" then @pieces = @pieces.where('inventory > 0').order("view_count desc")
      when "nameasc" then @pieces = @pieces.where('inventory > 0').order("title asc")
      when "namedesc" then @pieces = @pieces.where('inventory > 0').order("title desc")
      else @pieces = @pieces.where('inventory > 0').order("created_at desc")
    end

    search_text = params[:search]
    search_min = params[:search_min]
    search_max = params[:search_max]
    @pieces = @pieces.search_all(search_text) if search_text.present?
    @pieces = @pieces.where('? <= price', search_min) if search_min.present?
    @pieces = @pieces.where('price <= ?', search_max) if search_max.present?
    @pieces = @pieces.where('? <= price AND price <= ?', search_min, search_max) if search_min.present? && search_max.present?
    if params[:filter_cat].present?
      piece_categories = PieceCategory.joins(:piece, :category).where(category_id: params[:filter_cat])
      @pieces = @pieces.where id: piece_categories.map{|r| r.piece_id}
    end
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
    params.require(:piece).permit(:title, :price, :inventory, :description, :photo, :artist_id, category_ids: [])
  end

end
