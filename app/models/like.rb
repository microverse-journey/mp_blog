class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create update_likes_counter()

  # updates the likes counter for a post
  def update_likes_counter
    post = Post.find(post_id)
    count = where(post_id: post_id).count
    post.update(:comments_counter count)
  end
end
