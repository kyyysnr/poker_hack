class CommentLikesController < ApplicationController
  def create
    @comment = Comment.find_by(id: params[:comment_id])
    @comment_like = CommentLike.new(comment_id: params[:comment_id], ip: request.remote_ip)
    @comment_like.save
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find_by(id: params[:comment_id])
    @comment_like = CommentLike.find_by(comment_id: params[:comment_id], ip: request.remote_ip)
    @comment_like.destroy
    #redirect_back(fallback_location: root_path)
  end
end
