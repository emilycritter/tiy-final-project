class PiecesController < ApplicationController
  def index
    @pieces = Piece.all.order("title asc")
  end

  def show
    @piece = Piece.find_by id: params[:id]
  end
end
