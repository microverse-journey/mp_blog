require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'Harry Potter', photo: 'http://tactes.com/image', bio: 'User bio', posts_counter: 0) }

  subject { Post.create(author:, title: 'post title', comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  describe 'association' do
    it 'has many comments' do
      have_many(:comments)
    end
    it 'has many likes' do
      have_many(:likes)
    end
  end

  describe 'validation' do
    it 'has a valid title value' do
      expect(subject).to be_valid
    end

    it 'has an invalid title value' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'has maximum title length of 250' do
      expect(subject.title.length).to be < 251
    end

    it 'has a comments_counter attribute greater than or equal to 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'has a likes_counter attribute greater than or equal to 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#update_user_posts_counter' do
    it 'should return number of posts for an author' do
      expect(author.posts_counter).to eq(1)
    end
  end

  describe '#five_most_recent_comments' do
    it 'should return recent comments less than or equal to 5' do
      5.times do
        Comment.create author: author, post: subject, text: "comment one"
      end

      expect(subject.five_most_recent_comments.count).to eq(5)
    end
  end
end
