class Team < ApplicationRecord
  # Direct associations

  has_many   :tennis_players,
             :foreign_key => "teams_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
