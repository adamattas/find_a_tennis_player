class HomeCourt < ApplicationRecord
  # Direct associations

  belongs_to :teams,
             :class_name => "Team"

  # Indirect associations

  # Validations

end
