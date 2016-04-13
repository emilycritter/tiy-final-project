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
    @piece = Piece.find_by id: params[:id]
    if @piece.artist.user != @current_user
      redirect_to piece_path(id: @piece.id)
    end
  end

  def update
    @piece = Piece.find_by id: params[:id]
    if @piece.update piece_params
      redirect_to piece_path(id: @piece.id)
    else
      render :edit
    end
  end

  def destroy
    @piece = Piece.find_by id: params[:id]
    @piece.destroy
    redirect_to artist_path(name_parameterize: @piece.artist.name_parameterize)
  end

  def piece_params
    params.require(:piece).permit(:title, :description, :price, :inventory, :photo, :artist_id)
  end
end
