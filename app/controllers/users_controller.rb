class UsersController < ApplicationController

  def show #the profile display page for the helper
    @user = User.find(params[:id])
    @users_favorite = current_user.favorites.find { |favorite| favorite.helper_id == @user.id && favorite.senior_id == current_user.id }
  end

  def index #the index page for the helper
    query = params[:help_request]
    @helpers = User.where(user_type: "helper")

    unless query.nil?
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

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
    redirect_to dashboard_path
  end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
