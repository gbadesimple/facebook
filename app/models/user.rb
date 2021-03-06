class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]
  after_create :email_new_user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :commentlikes, dependent: :destroy

  has_many :friend_requests_as_sender, foreign_key: "sender_id", class_name: "FriendRequest", inverse_of: "sender", dependent: :destroy
  has_many :friend_requests_as_receiver, foreign_key: "receiver_id", class_name: "FriendRequest", inverse_of: "receiver", dependent: :destroy

  has_many :friends, -> { merge(FriendRequest.friends) }, through: "friend_requests_as_receiver", source: "sender"
  has_many :pending_requests, -> { merge(FriendRequest.not_friends) }, through: "friend_requests_as_receiver", source: "sender"
  has_many :received_requests, -> { merge(FriendRequest.not_friends) }, through: "friend_requests_as_sender", source: "receiver"

  def i_and_my_friends_and_our_posts
    myfriends = friends
    our_post = []
    myfriends.each do |friend|
      friend.posts.each do |post|
        our_post.push(post) # our_post << post
      end
    end
    posts.each do |post|
      our_post.push(post) # our_post << post
    end
    our_post.sort!{|first, last| last <=> first}
  end

  def email_new_user
    UserMailer.welcome_mail(self).deliver_now
  end


end
