class Review < ApplicationRecord
  belongs_to :help_request
  validates :description, length: { minimum: 10 }
  validates :friendliness_rating, presence: true, inclusion: { in: 1..5 }
  validates :efficiency_rating, presence: true, inclusion: { in: 1..5 }
  validates :punctuality_rating, presence: true, inclusion: { in: 1..5 }
  validates :recommend, inclusion: { in: [true, false] } # , default: true Default validation does not exist
  # Had to delete the presence = true because "false is considered as not being present"

  EFFICIENCY = [['Very Unhappy', 1], ['Unhappy', 2], ['Average', 3], ['Happy', 4], ['Very Happy', 5]]
  PUNCTUALITY = [['Extremely Late', 1], ['Very late', 2], ['Late', 3], ['On Time', 4], ['Perfectly On Time', 5]]
  FRIENDLINESS = [['Rude and Disrespectful', 1], ['Rude', 2], ['Average', 3], ['Friendly', 4], ['Lovely', 5]]
end
