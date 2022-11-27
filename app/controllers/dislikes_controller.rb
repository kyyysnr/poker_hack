class DislikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @dislike = Dislike.new(post_id: params[:post_id], ip: request.remote_ip)
    @dislike.save

  end

  def destroy
    @post = Post.find(params[:post_id])
    @dislike = Dislike.find_by(params[:post_id], ip:request.remote_ip)
    @dislike.destroy

  end
end
