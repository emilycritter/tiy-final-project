require 'open-uri'

class Api::PiecesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @pieces = Piece.all.order("title asc")
  end

  def show
    @piece = Piece.find_by id: params[:id]
  end

  def create
    @piece = Piece.new piece_params

    @piece.artist = @current_user

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
    params.require(:piece).permit(:title, :price, :inventory, :description, :photo)
  end

end
