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

  def price_formatted
    a,b = sprintf("%0.2f", price).split('.')
    a.gsub!(/(\d)(?=(\d{3})+(?!\d))/, '\\1,')
    "$#{a}.#{b}"
  end

end
