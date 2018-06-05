class AddLocationLongitudeToHomeCourt < ActiveRecord::Migration[5.0]
  def change
    add_column :home_courts, :location_longitude, :float
  end
end
