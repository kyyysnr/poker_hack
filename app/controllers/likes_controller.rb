class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(post_id: params[:post_id], ip: request.remote_ip)
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(params[:post_id], ip:request.remote_ip)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
