require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:author) { User.create(name: 'Harry Potter', photo: 'http://tactes.com/image', bio: 'User bio', posts_counter: 0) }
  let(:post) { Post.create(author:, title: 'post title', comments_counter: 0, likes_counter: 0) }
  subject { Comment.create(post:, author:, text: 'new comment') }

  describe 'new comment' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe '#update_post_comments_counter' do
    it 'should update number of comments when a comment is created or deleted' do
      expect(subject.post.comments_counter).to eq(1)
    end
  end
end
