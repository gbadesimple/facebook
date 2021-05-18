class Comment < ApplicationRecord
#  validates :body, presence: true
  belongs_to :user
  belongs_to :post

  has_many_attached :images, dependent: :destroy
end
