class UsersController < ApplicationController
  
  def show #the profile display page for the helper
    @user = User.find(params[:id])
  end
  
end
