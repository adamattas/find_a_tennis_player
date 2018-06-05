class AddLocationFormattedAddressToHomeCourt < ActiveRecord::Migration[5.0]
  def change
    add_column :home_courts, :location_formatted_address, :string
  end
end
