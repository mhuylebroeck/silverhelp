class HelpRequest < ApplicationRecord
    #THIS
  belongs_to :senior, class_name: "User", optional: true, foreign_key: "senior_id"
  belongs_to :helper, class_name: "User", optional: true, foreign_key: "helper_id"

  scope :active, -> { where(status: [:pending, :accepted]) }
  scope :done, -> { where(status: [:completed]) }


  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


  belongs_to :task
  has_one :review, dependent: :destroy
  validates :start_time, presence: true, allow_blank: false
  validates :duration, presence: true
  validates :task_id, presence: true
  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2,
    completed: 3
  }

# ["Small (0-1 hour)", "Medium (1 hour)", "Large (2-4 hours)"]
 CATEGORIES = [['Small     (0-1 hour)', '1'], ['Medium    (1-2 hours)', '2'], ["Large    (2-4 hours)", 3 ]]
end
