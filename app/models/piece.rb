class Piece < ActiveRecord::Base
  belongs_to :artist
  has_many :order_items

  validates :title, presence: true

  attachment :photo

  include PgSearch
  pg_search_scope :search_all, :against => [:title, :description], :associated_against => {
    :artist => [:shop_name] }

  def price_in_cents
    price * 100
  end

end
