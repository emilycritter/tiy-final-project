class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :piece_id
      t.boolean :shipped, default: false
      t.integer :quantity, default: 0
      t.decimal :price, default: 0

      t.timestamps null: false
    end
  end
end
