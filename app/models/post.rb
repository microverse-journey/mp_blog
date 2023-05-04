class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  # returns the 3 most recent posts for a given user
  def self.three_most_recent(author_id)
    where(author_id: author_id).order("created_at": :desc).limit(3)
  end
end