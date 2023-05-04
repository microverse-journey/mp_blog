class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_likes_counter
  after_destroy :update_likes_counter

  # updates the likes counter for a post
  def update_post_likes_counter
    post.update_likes
  end
end
