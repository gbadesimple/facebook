class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  scope :friends, -> { where("status = ?", true) }
  scope :not_friends, -> { where("status = ?", false) }
end
