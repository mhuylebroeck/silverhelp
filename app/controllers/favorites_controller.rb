class FavoritesController < ApplicationController
    def create
    @favorite = FavoriteHelper.new
    @favorite.senior = current_user
    @favorite.helper = User.find(params[:user_id])
    if @favorite.save!
      redirect_to user_path(@favorite.helper)
    end
  end
end
