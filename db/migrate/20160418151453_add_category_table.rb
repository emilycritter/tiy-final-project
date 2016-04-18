class AddCategoryTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :piece_categories do |t|
      t.integer :category_id
      t.integer :piece_id

      t.timestamps null: false
    end

  end
end
