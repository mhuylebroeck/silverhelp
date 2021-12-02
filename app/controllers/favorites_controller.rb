class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new
    @favorite.senior = current_user
    @favorite.helper = User.find(params[:user_id])
    if @favorite.save!
      redirect_to user_path(@favorite.helper, params.permit!)
    end


  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy!
      redirect_to user_path(@favorite.helper, params.permit!)
    end
  end

end
