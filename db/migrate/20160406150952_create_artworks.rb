class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :user_id
      t.string :title
      t.float :price, default: 0.0
      t.integer :inventory, default: 1
      t.text :description
      t.string :photo_id

      t.timestamps null: false
    end
  end
end
