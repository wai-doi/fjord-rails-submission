class Comment < ApplicationRecord
  belongs_to :report
  validates :body, presence: true
end
