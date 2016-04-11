class Piece < ActiveRecord::Base
  belongs_to :artist

  validates :title, presence: true

  attachment :photo

  def price_in_cents
    price * 100
  end
end
