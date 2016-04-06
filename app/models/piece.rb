class Piece < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true

  attachment :photo
end
