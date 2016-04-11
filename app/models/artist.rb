class Artist < ActiveRecord::Base
  before_create { define_parameterize(:name_parameterize) }

  has_many :pieces, dependent: :destroy
  belongs_to :user

  validates :shop_name, presence: true
  validates :name_parameterize, uniqueness: true

  attachment :photo

  def define_parameterize(column)
    self[column] = self.shop_name.parameterize
  end


end
