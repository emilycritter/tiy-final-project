class AddLatLongToUser < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :string
    add_column :users, :longitude, :string
    add_column :users, :ip_address, :string
  end
end
