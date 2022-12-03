class SearchesController < ApplicationController

  def search
    @posts = Post.where("body LIKE?", "%#{params[:body]}%")
  end
end
