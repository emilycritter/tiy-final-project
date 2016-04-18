class AddCityStateToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :city, :string, default: "Nowhere"
    add_column :artists, :state, :string, default: "USA"
  end
end
