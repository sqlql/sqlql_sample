class Comment < ApplicationRecord
  belongs_to :user

  scope :for_haute_couture, -> (user) {
    base = Comment.select(:id, :content, :created_at, :updated_at)
    base.where(privacy: false).or(base.where(user: user))
  }
end
