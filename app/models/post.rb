class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_defaults
  after_create :update_user_posts_counter
  after_destroy :update_user_posts_counter

  # updates the posts counter for a user.
  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  # returns the 5 most recent comments for a given post.
  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def set_defaults
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
