module ApplicationHelper
  private
  def friends
    @friends = current_user.friend_requests_as_receiver.select{ |request| request.status == true }
  end

  def friendrequests
    @friendrequests = current_user.friend_requests_as_receiver.select{ |request| request.status == false }
  end

end
