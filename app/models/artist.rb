class Artist < ActiveRecord::Base
  before_validation(on: :create) do
    self.name_parameterize = self.shop_name.parameterize if attribute_present?("shop_name")
  end

  has_many :pieces, dependent: :destroy
  belongs_to :user

  validates :shop_name, :location, presence: true
  validates :name_parameterize, uniqueness: true

  attachment :photo

  geocoded_by :location
  after_validation :geocode

  include PgSearch
  pg_search_scope :search_all, :against => [:shop_name, :bio, :location]

  def photo_url
    Refile.attachment_url(self, :photo, :fill, 300, 300, format: "jpg")
  end

  def artist_url
    Rails.application.routes.url_helpers.artist_path(name_parameterize: name_parameterize)
  end
end
