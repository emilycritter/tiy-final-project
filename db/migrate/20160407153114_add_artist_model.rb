class AddArtistModel < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :shop_name
      t.string :name_parameterize
      t.string :photo_id
      t.text :bio
      t.integer :user_id

      t.timestamps null: false
    end

    remove_column :users, :artist_boolean
    remove_column :users, :photo_id
    remove_column :users, :bio

    remove_column :pieces, :user_id
    add_column :pieces, :artist_id, :integer
  end
end
