class PostsController < ApplicationController
  before_action :authenticate_user!
  include PostsHelper

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

      redirect_to posts_path
    else
      flash[:alert] = "You have not entered a string in the column provided!"
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post successfully deleted"
      redirect_to posts_path
    else
      flash[:alert] = "We are unable to delete your post"
      render posts_path
    end
  end

end
