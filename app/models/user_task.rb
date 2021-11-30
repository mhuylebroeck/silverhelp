class UserTask < ApplicationRecord
  ALL_TASKS = ["Groceries", "Home repairs", "Furniture assembly", "Cleaning", "Wheelchair assistance",
               "Company for excursion", "Cooking", "Social Activities"]

  belongs_to :user
  belongs_to :task
  validates :user, uniqueness: {scope: :task}
end
