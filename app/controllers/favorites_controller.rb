class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(current_user.id)
    @favorite = Favorite.new(user_id: @user.id, post_id: @post.id)
    @favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @user = User.find(current_user.id)
    @favorite = Favorite.find_by(user_id: @user.id, post_id: @post.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
