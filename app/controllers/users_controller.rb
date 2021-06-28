class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def index
    @users = User.all.order(created_at: :DESC)
    @pending_requests = current_user.pending_requests
    @received_requests = current_user.received_requests
    friends
    friendrequests
    @posts = current_user.i_and_my_friends_and_our_posts
  end

  def show
    friends
    friendrequests

  end

  private
  def friends
    @friends = current_user.friend_requests_as_receiver.select{ |request| request.status == true }
  end

  def friendrequests
    @friendrequests = current_user.friend_requests_as_receiver.select{ |request| request.status == false }
  end

end
