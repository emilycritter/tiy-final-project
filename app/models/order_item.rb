class OrderItem < ActiveRecord::Base
  belongs_to :piece
  belongs_to :order

  def total_price
    quantity * price
  end
end
