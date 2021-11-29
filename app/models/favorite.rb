class Favorite < ApplicationRecord
  belongs_to :senior, class_name: "User", optional: true, foreign_key: "senior_id"
  belongs_to :helper, class_name: "User", optional: true, foreign_key: "helper_id"
end
