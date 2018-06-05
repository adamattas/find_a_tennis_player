class CreateHomeCourts < ActiveRecord::Migration
  def change
    create_table :home_courts do |t|
      t.integer :teams_id
      t.string :location

      t.timestamps

    end
  end
end
