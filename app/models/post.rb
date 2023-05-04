class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  #   updates the posts counter for a user.
  def self.update_counter
    user = User.find_by(author_id: author_id)
    user.update(posts_counter: user.posts.count)
  end

  # returns the 5 most recent comments for a given post.
  def five_most_recent_comments(post_id)
    Comment.where(post_id: post_id).order("created_at" :desc).limit(5)
  end

  # update likes counter
  def update_likes
    self.likes_counter = self.likes.count
    self.save
  end

  # update comment counter
  def update_comments
    self.comments_counter = self.comments.count
    self.save
  end
end