class LikesController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(post_id: params[:post_id], ip: request.remote_ip)
    @like.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(params[:post_id], ip:request.remote_ip)
    @like.destroy
  end
end
