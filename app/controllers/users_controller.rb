class UsersController < ApplicationController

  def show #the profile display page for the helper
    @user = User.find(params[:id])
  end

  def index #the index page for the helper
    query = params[:help_request]
    @helpers = User.where(user_type: "helper")
    @helpers = @helpers.joins(:user_tasks).where(user_tasks: { task_id: query[:task_id] })
    @helpers = @helpers.near(query["location"], 10)
    selected_weekday = Date.parse(query["start_time"]).strftime('%A').downcase #"thursday"
    @helpers = @helpers.joins(:availabilities).where(availabilities: {weekday: selected_weekday})
    @helpers = @helpers.distinct
    @location = params[:help_request][:location].split(", ")[0..1].join(", ")
    @time = params[:help_request][:start_time]
    @time = DateTime.parse(@time).strftime('%a, %e %b')
  end

end
