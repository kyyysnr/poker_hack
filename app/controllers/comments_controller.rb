class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @post = Post.find_by(id: @comment.post_id)
      #コメントが新規入力された時に元の投稿のupdated_atを変えることによりpost/indexで並び順を変える
      @post.updated_at = @comment.created_at
      @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id,:body,images: [])
  end
end
