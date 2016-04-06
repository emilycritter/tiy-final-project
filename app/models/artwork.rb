class Artwork < ActiveRecord::Base
  validates :title, presence: true

  attachment :photo
end
