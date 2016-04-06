class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_secure_password

  attachment :photo

  def full_name
    [first_name, last_name].join(' ')
  end

  def name_parameterize
    full_name.parameterize
  end
end
