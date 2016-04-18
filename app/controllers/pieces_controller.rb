class PiecesController < ApplicationController
  def index
    search_text = params[:search]
    search_min = params[:search_min].to_i
    search_max = params[:search_max].to_i

    @pieces = Piece.where('inventory > 0').order("created_at desc")

    case params[:sort]
      when "lowhigh" then @pieces = @pieces.order("price asc")
      when "highlow" then @pieces = @pieces.order("price desc")
      when "newestfirst" then @pieces = @pieces.order("created_at desc")
      when "popular" then @pieces = @pieces.order("view_count desc")
      when "nameasc" then @pieces = @pieces.order("title asc")
      when "namedesc" then @pieces = @pieces.order("title desc")
    end

    @pieces = @pieces.search_all(search_text) if search_text.present?
    if search_min.present? && search_max.present?
      @pieces = @pieces.where('? <= price AND price <= ?', search_min, search_max)
    elsif search_min.present?
      @pieces = @pieces.where('? <= price', search_min)
    elsif search_max.present?
      @pieces = @pieces.where('price <= ?', search_max)
    end
    @pieces_count = @pieces.count
    @pieces = @pieces.page(params[:page]).per(48)
  end

  def show
    @piece = Piece.find_by id: params[:id]
    @piece.view_count += 1
    @piece.save
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new piece_params
    @artist = @current_user.artist
    @piece.artist = @artist
    if @piece.save
      redirect_to artist_path(id: @artist.id)
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
    redirect_to artist_path(id: @piece.artist.id)
  end

  def piece_params
    params.require(:piece).permit(:title, :description, :price, :inventory, :photo, :artist_id, category_ids: [])
  end
end
