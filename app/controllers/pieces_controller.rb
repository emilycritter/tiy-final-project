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
end
