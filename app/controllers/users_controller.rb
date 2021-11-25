class UsersController < ApplicationController

  def show #the profile display page for the helper
    @user = User.find(params[:id])
  end

  def index #the index page for the helper
    @helpers = User.where(user_type: "helper")
    @helpers = @helpers.where(helper.task_ids.include?(params["help_request"]["task_id"]))
    @helpers = @helpers.where(location: params["help_request"]["location"]) #none will work because :locations are complete address and params_location are just barcelona normaly.

    selected_weekday = Date.parse(params["help_request"]["start_time"]).strftime('%A') #"thursday"
    @final_helpers = []
    @helpers.each do |helper|
      helper.availabilities.each do |availability|
        if availability.weekday == selected_weekday
          @final_helpers << helper
        end
      end
    end

      raise
    if params[:location].present? && params[:task].present?
      # @helpers = User.where(user_type: "helper" && params[:location] == :location && params[:tasks].include(params[:task]))
      # You can use the "near" for the location, as we used in the "leave your shit", to find every person near the address
    elsif params[:task].present?
      # @helpers = User.where(user_type: "helper" && params[:tasks].include(params[:task]))
    elsif params[:location].present?
      # @helpers = User.where(user_type: "helper" && params[:location] == :location))
      # See comments above
    else
      # @helpers = User.where(user_type: "helper")
    end
  end

end
