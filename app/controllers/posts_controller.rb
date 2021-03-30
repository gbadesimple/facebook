class PostsController < ApplicationController

  def index
    @posts = Post.all.order(:created_at => "desc")
    @post = Post.new
  end

  def show
    @post = Post.find_by_user_id(params[:user_id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash.notice = "Posted succesfully"

      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title)
  end
end
