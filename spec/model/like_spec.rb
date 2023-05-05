require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { User.create(name: 'Harry Potter', photo: 'http://tactes.com/image', bio: 'User bio', posts_counter: 0) }
  let(:post) { Post.create(author:, title: 'post title', comments_counter: 0, likes_counter: 0) }
  subject { Like.create(post:, author:) }

  describe 'new comment' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe '#update_post_likes_counter' do
    it 'should update number of post likes when a post is liked ' do
      expect(subject.post.likes_counter).to eq(1)
    end
  end

end
