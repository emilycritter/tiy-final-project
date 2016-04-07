require 'open-uri'

class Api::ArtistsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @artists = Artist.all.order("shop_name asc")
  end

  def show
    @artist = Artist.find_by id: params[:id]
  end

  def create
    @artist = Artist.new artist_params

    url = params[:artist][:photo_url]
    if url.present?
      open(url, "rb") do |file|
        @artist.photo = file
      end
    end

    if @artist.save
      render :show
    else
      render json: {errors: @artist.errors}, status: 422
    end

  end

  def update
    @artist = Artist.find_by id: params[:id]

    url = params[:artist][:photo_url]
    if url.present?
      open(url, "rb") do |file|
        @artist.photo = file
      end
    end

    if @artist.update artist_params
      render :show
    else
      render json: {errors: @artist.errors}, status: 422
    end
  end

  def destroy
    @artist = Artist.find_by id: params[:id]
    @artist.destroy
    head :ok
  end

  def artist_params
    params.require(:artist).permit(:shop_name, :photo, :bio, :user_id, :photo)
  end
end
