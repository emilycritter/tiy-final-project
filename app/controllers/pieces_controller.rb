class PiecesController < ApplicationController
  def index
    @pieces = Piece.where('inventory > 0').order("title asc")
    search_text = params[:search]
    if search_text.present?
      @pieces = @pieces.search_all(search_text)
    end
  end

  def show
    @piece = Piece.find_by id: params[:id]
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new piece_params
    @artist = @current_user.artist
    @piece.artist = @artist
    if @piece.save
      redirect_to artist_path(name_parameterize: @artist.name_parameterize)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def piece_params
    params.require(:piece).permit(:title, :description, :price, :inventory, :photo, :artist_id)
  end
end
