class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :likes
  has_many :comments

  # returns the 3 most recent posts for a given user
  def self.three_most_recent(author_id)
    Post.where(author_id:).order(created_at: :desc).limit(3)
  end
end
