class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         # THIS
  has_many :owned_help_requests, class_name: "HelpRequest", foreign_key: "senior_id", dependent: :destroy
  has_many :assigned_help_requests, class_name: "HelpRequests", foreign_key: "helper_id", dependent: :destroy



  has_many :availabilities, dependent: :destroy
  has_many :user_coupons, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks
  has_one_attached :avatar
  has_many :reviews, through: :help_requests

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
