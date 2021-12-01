class Coupon < ApplicationRecord
   validates :name, presence: true
   validates :description, presence: true
   validates :price, presence: true
  has_many :user_coupons
  # has_one_attached :picture
end
