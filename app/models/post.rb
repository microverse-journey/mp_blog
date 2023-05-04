class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  #   updates the posts counter for a user.
  def self.update_counter(author_id)
    count = where(author_id: author_id).count(:author_id)
    User.find_by(author_id: author_id).update(posts_counter: counter + 1)
  end

  # returns the 5 most recent comments for a given post.
  def five_most_recent_comments(post_id)
    Comment.where(post_id: post_id).order("created_at" :desc).limit(5)
  end
end