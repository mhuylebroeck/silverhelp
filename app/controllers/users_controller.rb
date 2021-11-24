class UsersController < ApplicationController

  def show #the profile display page for the helper
    @user = User.find(params[:id])
  end

  def index #the index page for the helper
    if params[:location].present? && params[:task].present?
      # @helpers = User.where(user_type: "helper" && params[:location] == :location && params[:tasks].include(params[:task]))
      # You can use the "near" for the location, as we used in the "leave your shit", to find every person near the address
    elsif params[:task].present?
      @helpers = User.where(user_type: "helper" && params[:tasks].include(params[:task]))
    elsif params[:location].present?
      # @helpers = User.where(user_type: "helper" && params[:location] == :location))
      # See comments above
    else
      @helpers = User.where(user_type: "helper")
    end
  end

end
