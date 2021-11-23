class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :help_requests, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :user_coupons, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  # has_one_attached :photo #
  has_many :reviews, through: :help_requests
end
