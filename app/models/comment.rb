class Comment < ApplicationRecord
#  validates :body, presence: true
  belongs_to :user
  belongs_to :post

  has_many_attached :images, dependent: :destroy
  has_many :commentlikes, dependent: :destroy

  has_rich_text :body
end
