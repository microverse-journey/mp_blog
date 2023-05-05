class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :author, presence: true
  validates :text, presence: true
  validates :title, presence: true

  after_create :update_user_posts_counter
  after_destroy :update_user_posts_counter

  # updates the posts counter for a user.
  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  # returns the 5 most recent comments for a given post.
  def self.five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
