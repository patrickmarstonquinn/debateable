class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :debate

  belongs_to :user

  # Indirect associations

  # Validations

end
