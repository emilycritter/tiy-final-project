class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.order("shop_name asc")
    search_text = params[:search]
    if search_text.present?
      @artists = @artists.search_all(search_text)
    end
  end

  def show
    @artist = Artist.find_by name_parameterize: params[:name_parameterize]
  end

  def edit
  end

  def artist_params
    params.require(:artist).permit(:shop_name, :bio, :location, :photo)
  end
end
