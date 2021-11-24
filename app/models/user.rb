class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :help_requests, dependent: :destroy, foreign_key: :senior
  has_many :availabilities, dependent: :destroy
  has_many :user_coupons, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks
  has_one_attached :avatar
  has_many :reviews, through: :help_requests
end
