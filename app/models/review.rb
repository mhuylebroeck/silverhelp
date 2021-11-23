class Review < ApplicationRecord
belongs_to :help_request
validates :description, length: { minimum: 10 }
validates :friendliness_rating, presence: true, inclusion: { in: [1..5] }
validates :efficiency_rating, presence: true, inclusion: { in: [1..5] }
validates :punctuality_rating, presence: true, inclusion: { in: [1..5] }
validates :recommend, presence: true, default: true
end
