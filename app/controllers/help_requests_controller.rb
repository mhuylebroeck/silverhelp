class HelpRequestsController < ApplicationController

  def new
    @help_request = HelpRequest.new
    @tasks = Task.all
  end

  def show
    @request = HelpRequest.find(params[:id])
  end

  def create
    @help_request = HelpRequest.new(helper_params)
    @help_request.senior_id = current_user.id
    @help_request.helper_id = params["user_id"].to_i
    if @help_request.save!
      redirect_to help_request_path(@help_request)
    else
      render "help_requests/new"
    end
  end

  def update
    @help_request = HelpRequest.find(params[:id])
    if @help_request.update(status: params[:status])
      redirect_to dashboard_path
    end
  end

  def destroy
    @help_request = HelpRequest.find(params[:id])
    if @help_request.destroy
      redirect_to dashboard_path
    end
  end

  private

  def helper_params
    params.require(:help_request).permit(:start_time, :duration, :location, :task_id, :task_description, :user_id)
  end
end
