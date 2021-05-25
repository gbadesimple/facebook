class Post < ApplicationRecord
  validates_presence_of :title
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  
  has_many :likes, dependent: :destroy

end
