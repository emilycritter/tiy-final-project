class AddOrderConfirmationNumber < ActiveRecord::Migration
  def change
    add_column :orders, :order_confirmation, :string
  end
end
