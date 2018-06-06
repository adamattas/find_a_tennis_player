class AddTennisPlayerCountToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :tennis_players_count, :integer
  end
end
