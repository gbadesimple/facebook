class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :commentlikes, dependent: :destroy

  has_many :friend_requests_as_sender, foreign_key: "sender_id", class_name: "FriendRequest", dependent: :destroy
  has_many :friend_requests_as_receiver, foreign_key: "receiver_id", class_name: "FriendRequest", dependent: :destroy
end
