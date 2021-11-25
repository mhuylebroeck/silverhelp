class UsersController < ApplicationController

  def show #the profile display page for the helper
    @user = User.find(params[:id])
  end

  def index #the index page for the helper
    query = params[:help_request]
    @helpers1 = User.where(user_type: "helper")
    @helpers = @helpers1.joins(:user_tasks).where(user_tasks: { task_id: query[:task_id] })
    @helpers = @helpers.near(query["location"], 10) #none will work because :locations are complete address and params_location are just barcelona normaly.
    selected_weekday = Date.parse(query["start_time"]).strftime('%A').downcase #"thursday"
    @helpers = @helpers.joins(:availabilities).where(availabilities: {weekday: selected_weekday})
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
