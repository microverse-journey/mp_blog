class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  #   updates the posts counter for a user.
  def self.update_counter(author_id)
    count = where(author_id: author_id).count(:author_id)
    User.find_by(author_id: author_id).update(posts_counter: counter + 1)
  end
end