class User < ActiveRecord::Base
  has_one :artist, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  geocoded_by :location
  after_validation :geocode if :location

  has_secure_password

  def full_name
    [first_name, last_name].join(' ')
  end

end
