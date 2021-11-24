class UsersController < ApplicationController

  def show #the profile display page for the helper
    @user = User.find(params[:id])
  end

  def index #the index page for the helper
    @helpers = User.where(user_type: "helper")
  end

end
