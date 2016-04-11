class User < ActiveRecord::Base
  has_one :artist

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_secure_password

  geocoded_by :ip_address
  after_validation :geocode

  def full_name
    [first_name, last_name].join(' ')
  end

end
