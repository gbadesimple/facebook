class PostsController < ApplicationController
  before_action :authenticate_user!
  include PostsHelper
  include ApplicationHelper

  def index
    @posts = current_user.i_and_my_friends_and_our_posts  #Timeline
    @post = Post.new
    friends
    friendrequests
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
