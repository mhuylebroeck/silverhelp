class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :help_requests
  has_many :availabilities
  has_many :user_coupons
  has_many :user_tasks
  has_one_attached :photo
  has_many :reviews, through: :help_requests
end
