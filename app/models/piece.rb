class Piece < ActiveRecord::Base
  belongs_to :artist
  has_many :order_items
  has_many :favorites, dependent: :destroy
  has_many :piece_categories, dependent: :destroy
  has_many :categories, through: :piece_categories

  validates :title, presence: true

  attachment :photo

  include PgSearch
  pg_search_scope :search_all, :against => [:title, :description], :associated_against => {
    :artist => [:shop_name] }
  pg_search_scope :search_location, :associated_against => {
    :artist => [:location] }

  def price_in_cents
    price * 100
  end

  def price_formatted
    a,b = sprintf("%0.2f", price).split('.')
    a.gsub!(/(\d)(?=(\d{3})+(?!\d))/, '\\1,')
    "$#{a}.#{b}"
  end

  def photo_url
    Refile.attachment_url(self, :photo, :fill, 300, 300, format: "jpg")
  end

  def piece_url
    Rails.application.routes.url_helpers.piece_path(id: id)
  end

end
