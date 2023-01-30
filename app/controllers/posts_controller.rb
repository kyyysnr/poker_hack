class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @posts = Post.page(params[:page]).order(updated_at: :desc)

    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:id])
    @likes = Like.where(post_id: params[:id])
    @like = Like.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully destroyed."
  end

  private

  def post_params
    params.require(:post).permit(:youtube_url, :body, images: [])
  end

end
