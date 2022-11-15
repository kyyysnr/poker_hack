class DislikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @dislike = Dislike.new(post_id: params[:post_id], ip: request.remote_ip)
    @dislike.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @dislike = Dislike.find_by(params[:post_id], ip:request.remote_ip)
    @dislike.destroy
    redirect_back(fallback_location: root_path)
  end
end
