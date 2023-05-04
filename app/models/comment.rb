class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # updates the comments counter for a post
  def update_comments_counter(post_id)
    count = where(post_id: post_id).count(:post_id)
    Post.find(post_id).update(:comments_counter count)
  end
end
