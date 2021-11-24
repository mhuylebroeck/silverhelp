class HelpRequest < ApplicationRecord
  belongs_to :senior, class_name: "User", optional: true
  belongs_to :helper, class_name: "User", optional: true
  belongs_to :task
  has_one :review, dependent: :destroy
  validates :start_time, presence: true, allow_blank: false
  validates :duration, presence: true
  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }
end
