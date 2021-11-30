class UserCouponsController < ApplicationController
  def create
    chosen_coupon = Coupon.find(params[:coupon_id])
    if current_user.points_balance < chosen_coupon.price
      flash[:alert] = ""
      redirect_to coupons_path, alert: "Not enough points!"
    else
      new_user_coupon = UserCoupon.new(
        user: current_user,
        coupon: chosen_coupon
      )
      if new_user_coupon.save
        current_user.points_balance = current_user.points_balance - chosen_coupon.price
        current_user.save
        redirect_to dashboard_path, notice: "Coupon bought successfully!"
      else
        redirect_to coupons_path, alert: "Something went wrong! Please try again later."
      end
    end
  end
end
