class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @user = User.find(current_user.id)
    @favorite = Favorite.new(user_id: @user.id, post_id: @post_id)
    @favorite.save
    redirect_back(fallback_location: root_path)
  end 
  
  def destroy
    @post = Post.find(params[:id])
    @user = User.find(current_user.id)
    @favorite = Favorite.find_by(user_id: @user.id, post_id: @post_id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end 
end
