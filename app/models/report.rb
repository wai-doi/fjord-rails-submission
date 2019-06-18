class Report < ApplicationRecord
  has_many :comments, as: :commentable
  validates :title, presence: true
end
