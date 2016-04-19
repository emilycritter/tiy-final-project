class LatLonAsFloat < ActiveRecord::Migration
  def change
    remove_column :artists, :latitude, :string
    remove_column :artists, :longitude, :string
    add_column :artists, :latitude, :float
    add_column :artists, :longitude, :float

    remove_column :users, :latitude, :string
    remove_column :users, :longitude, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
