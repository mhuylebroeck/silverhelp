class Availability < ApplicationRecord
  WEEKDAYS = %w[monday tuesday wednesday thursday friday saturday sunday]
  belongs_to :user
  validates :weekday, inclusion: { in: WEEKDAYS }, presence: true
end
