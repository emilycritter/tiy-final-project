class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.boolean :artist_boolean
      t.string :photo_id
      t.text :bio

      t.timestamps null: false
    end
  end
end
