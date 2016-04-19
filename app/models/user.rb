class User < ActiveRecord::Base
  has_one :artist, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :phone_number, format: { with: /\A[+-]?\d+\Z/, message: "remove characters" }

  geocoded_by :location
  after_validation :geocode if :location

  has_secure_password

  def full_name
    [first_name, last_name].join(' ')
  end

end
