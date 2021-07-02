module FriendRequestsHelper
  private
  def already_exist_request_first_end
    receiver_id = params[:receiver_id]
    sender_id = params[:user_id]
    FriendRequest.where("sender_id = ?  AND  receiver_id = ?", sender_id, receiver_id).exists?
  end

  def already_exist_request_second_end
    receiver_id = params[:receiver_id]
    sender_id = params[:user_id]
    FriendRequest.where("sender_id = ?  AND  receiver_id = ?", receiver_id, sender_id,).exists?
  end

end
