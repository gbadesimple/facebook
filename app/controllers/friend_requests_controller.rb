class FriendRequestsController < ApplicationController
  include FriendRequestsHelper
  
  def index
    @requests = current_user.friend_requests_as_receiver
    @friendrequests = current_user.friend_requests_as_receiver.select{ |request| request.status == false }
  end

  def new
    @users = User.order(:created_at => "DESC")
    #@request = FriendRequest.new
  end

  def create
    sender = params[:user_id]
    receiver = params[:receiver_id]
    @request = current_user.friend_requests_as_sender.build(sender_id: sender, receiver_id: receiver)
    redirect_to users_path and return flash.alert = "Request already exit to this user" if already_exist_request_first_end # prevent current_user from sending request more than once to a a user
    redirect_to users_path and return flash.alert = "Friendship to this user already exist or awaiting your acceptance of friend request" if already_exist_request_second_end
    if @request.save
      flash.notice = "Friend Request Sent!"
      redirect_to users_path
    else
      flash.alert = "We couldn't send your request this time."
      redirect_to users_path
    end
  end

  def update
    @request = FriendRequest.find(params[:id])
    if @request.update(status: params[:status])
      @request2 = current_user.friend_requests_as_sender.build(sender_id: @request.receiver.id, receiver_id: @request.sender.id, status: true)
      @request2.save

      flash.notice = "Friend Request Accepted"
      redirect_to users_path
    else
      flash.alert = "Something went wrong, please check!"
      redirect_to users_path
    end
  end

  def destroy
    @request = FriendRequest.find(params[:id])
    if @request.destroy
      flash.notice = "Unfriend successful" if @request.status == true
      flash.notice = "Friend request declined!" if @request.status == false
      redirect_to users_path
    else
      flash.alert = "Unsuccessful request please try again"
      redirect_to users_path
    end
  end

end
