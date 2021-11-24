class UserTask < ApplicationRecord
  ALL_TASKS = ["Groceries", "Home repairs", "Furniture assembly", "Cleaning", "Wheelchair assistance",
               "Company for excursion", "Cooking", "Activities"]

  belongs_to :user
  belongs_to :task
end
