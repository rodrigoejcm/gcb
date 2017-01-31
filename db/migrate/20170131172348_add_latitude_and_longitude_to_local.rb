class AddLatitudeAndLongitudeToLocal < ActiveRecord::Migration[5.0]
  def change
    add_column :locais, :latitude, :float
    add_column :locais, :longitude, :float
  end
end
