class Piece < ActiveRecord::Base
  belongs_to :artist

  validates :title, presence: true

  attachment :photo
end
