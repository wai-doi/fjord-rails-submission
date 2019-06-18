class Book < ApplicationRecord
  has_many :comments, as: :commentable
  mount_uploader :picture, PictureUploader
  validates :title, presence: true
end
