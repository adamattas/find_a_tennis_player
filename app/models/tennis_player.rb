class TennisPlayer < ApplicationRecord
  # Direct associations

  belongs_to :teams,
             :class_name => "Team",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
