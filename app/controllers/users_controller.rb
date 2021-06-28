class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def index
    @users = User.all.order(created_at: :DESC)
    @friends = current_user.friend_requests_as_receiver.select{ |request| request.status == true }
    @pending_requests = current_user.pending_requests
    @received_requests = current_user.received_requests
    @friendrequests = current_user.friend_requests_as_receiver.select{ |request| request.status == false }
    @posts = current_user.i_and_my_friends_and_our_posts
  end
end
