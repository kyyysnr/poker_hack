class CommentDislikesController < ApplicationController
  def create
    @comment = Comment.find_by(id: params[:comment_id])
    @comment_dislike = CommentDislike.new(comment_id: params[:comment_id], ip: request.remote_ip)
    @comment_dislike.save
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find_by(id: params[:comment_id])
    @comment_dislike = CommentDislike.find_by(comment_id: params[:comment_id], ip: request.remote_ip)
    @comment_dislike.destroy
    #redirect_back(fallback_location: root_path)
  end
end
