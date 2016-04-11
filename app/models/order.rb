class Order < ActiveRecord::Base
  before_create { define_order_confirmation(:order_confirmation) }

  belongs_to :user
  has_many :order_items
  has_many :pieces, through: :order_items

  validates :order_confirmation, uniqueness: true
  validates :user_id, :status, presence: true

  def description
    "Order ##{id}: #{order_items.map{|order_item| order_item.piece.title}.join(', ')}"
  end

  def total_price
    order_items.map{|order_item| order_item.total_price}.sum
  end

  def total_price_in_cents
    (total_price * 100).to_i
  end

  def define_order_confirmation(column)
    self[column] = SecureRandom.hex(14)
  end
end
