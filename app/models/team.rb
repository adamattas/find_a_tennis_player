class Team < ApplicationRecord
  # Direct associations

  belongs_to :active_tournament,
             :class_name => "Tournament",
             :foreign_key => "tournament"

  has_many   :tennis_players,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
