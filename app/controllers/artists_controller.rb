class ArtistsController < ApplicationController
  def index
    @user_location = request.location
    if @user_location
      if @user_location.coordinates == [0.0, 0.0]
        @artists = Artist.near([29.7604, -95.3698], 500, :order => "distance") # set default coordinates to Houston
      else
        @artists = Artist.near(@user_location.coordinates, 500, :order => "distance")
      end
      @artists = @artists.map{|artist| artist}
    else
      @artists = Artist.all.order("shop_name asc")
    end

    search_text = params[:search]
    if search_text.present?
      @artists = Artist.search_all(search_text)
    end
  end

  def show
    @artist = Artist.find_by id: params[:id]
    @pieces = Piece.where('inventory > ? AND artist_id = ?', 0, @artist.id).order("title asc")
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new artist_params
    @artist.user_id = @current_user.id

    if @artist.save
      redirect_to artist_path(id: @artist.id)
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find_by id: params[:id]
    redirect_to root_path if @artist.nil? || @artist.user != @current_user
  end

  def update
    @artist = Artist.find_by id: params[:id]

    if @artist.update artist_params
      redirect_to artist_path(id: @artist.id)
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find_by id: params[:id]
    if @artist.user == @current_user
      @artist.destroy
      redirect_to root_path
    end
  end

  def artist_params
    params.require(:artist).permit(:shop_name, :bio, :photo, :location, :latitude, :longitude, :user_id)
  end

  def inventory
    @artist = Artist.find_by id: params[:id]

    redirect_to root_path if @artist.nil? || @artist.user != @current_user
  end
end
