class Availability < ApplicationRecord
  weekdays = %w[monday tuesday wednesday thursday friday saturday sunday]
  belongs_to :user
  validates :weekday, inclusion: { in: weekdays }, presence: true
end
