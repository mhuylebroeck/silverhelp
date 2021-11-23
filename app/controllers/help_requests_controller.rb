class HelpRequestsController < ApplicationController

  def new
    @help_request = HelpRequest.new
  end

  def create
    @help_request = HelpRequest.new(helper_params)
    @help_request.senior_id = current_user.id
    if @help_request.save!
      redirect_to users_path
    else
      render "help_requests/new"
    end
  end

  private

  def helper_params
    params.require(:help_request).permit(:start_time, :duration, :location, :task_id)
  end
end
