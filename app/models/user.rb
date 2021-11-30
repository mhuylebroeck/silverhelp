class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


         # THIS
  has_many :owned_help_requests, class_name: "HelpRequest", foreign_key: "senior_id", dependent: :destroy
  has_many :assigned_help_requests, class_name: "HelpRequest", foreign_key: "helper_id", dependent: :destroy

  has_many :availabilities, dependent: :destroy
  has_many :user_coupons, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks
  has_one_attached :avatar
  has_many :reviews, through: :help_requests
  has_many :favorites, foreign_key: :senior_id
  has_many :favorite_helpers, through: :favorites
  has_many :coupons, through: :user_coupons

  def help_requests
    # This is so that we can get all of the tasks someone has, no matter if they're a helper or a senior.
    HelpRequest.where("senior_id = ? OR helper_id = ?", self.id, self.id)
  end

  def helper?
    user_type == "helper"
  end

  def senior?
    user_type == "senior"
  end
end
