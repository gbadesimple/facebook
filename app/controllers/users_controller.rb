class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  include ApplicationHelper

  def index
    @users = User.all.order(created_at: :DESC)
    @pending_requests = current_user.pending_requests
    @received_requests = current_user.received_requests
    friends
    friendrequests
    #@posts = current_user.i_and_my_friends_and_our_posts
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @posts = @user.posts.order(:created_at => "DESC") # all the user's postss
    friends
    friendrequests
  end

end
