class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :teams

      t.timestamps

    end
  end
end
