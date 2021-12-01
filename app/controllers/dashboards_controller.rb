class DashboardsController < ApplicationController

  def show
    @user = current_user
    @help_requests = current_user.help_requests
    @favorites = current_user.favorites
    @coupons = current_user.coupons
  end

end
