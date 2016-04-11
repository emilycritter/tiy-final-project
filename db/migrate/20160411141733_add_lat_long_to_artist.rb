class AddLatLongToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :location, :string
    add_column :artists, :latitude, :string
    add_column :artists, :longitude, :string
  end
end
