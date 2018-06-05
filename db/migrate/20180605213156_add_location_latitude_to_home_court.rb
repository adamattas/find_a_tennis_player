class AddLocationLatitudeToHomeCourt < ActiveRecord::Migration[5.0]
  def change
    add_column :home_courts, :location_latitude, :float
  end
end
