class DashboardsController < ApplicationController

  def show
    @user = current_user
    @help_requests = current_user.help_requests
  end

end
