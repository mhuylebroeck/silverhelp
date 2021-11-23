class HelpRequest < ApplicationRecord
  belongs_to :senior, class_name: "User"
  belongs_to :helper, class_name: "User"
end
