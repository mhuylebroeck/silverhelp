class Task < ApplicationRecord
  validates :name, presence: true

  CATEGORIES = [['Groceries', Task.find_by(name: "Groceries").id],
  ['Home repairs', Task.find_by(name: "Home repairs").id],
  ["Furniture assembly", Task.find_by(name: "Furniture assembly").id ],
  ["Cleaning", Task.find_by(name: "Cleaning").id ],
  ["Wheelchair assistance", Task.find_by(name: "Wheelchair assistance").id ],
  ["Company for excursion", Task.find_by(name: "Company for excursion").id ],
  ["Cooking", Task.find_by(name: "Cooking").id ],
  ["Activities", Task.find_by(name: "Activities").id ]]
end
