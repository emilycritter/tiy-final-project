class Favorite < ActiveRecord::Base
  belongs_to :piece
  belongs_to :user

  validates :piece, :user, presence: true
  validates :piece_id, :uniqueness => {:scope=>:user_id}
end
