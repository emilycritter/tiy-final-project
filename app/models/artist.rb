class Artist < ActiveRecord::Base
  attr_accessor :name_parameterize
  before_create { name_parameterize }

  has_many :pieces, dependent: :destroy
  has_one :user

  validates :shop_name, presence: true
  validates :name_parameterize, uniqueness: true, on: create

  attachment :photo

  def name_parameterize
    shop_name.parameterize
  end


end
