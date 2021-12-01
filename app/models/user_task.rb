class UserTask < ApplicationRecord
  ALL_TASKS = ["Grocery shopping", "Home repairs", "Laundry", "Cleaning", "Wheelchair assistance",
               "Social activities", "Cooking", "Other"]

  belongs_to :user
  belongs_to :task
  validates :user, uniqueness: {scope: :task}
end
