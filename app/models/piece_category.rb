class PieceCategory < ActiveRecord::Base
  belongs_to :piece
  belongs_to :category

  validates :piece, :category, presence: true
  validates :piece_id, :uniqueness => {:scope=>:category_id}
end
