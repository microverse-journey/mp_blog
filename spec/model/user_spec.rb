require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Harry Potter', photo: 'http://tactes.com/image', bio: 'User bio', posts_counter: 0) }

  before { subject.save }

  describe 'association' do
    it 'has many posts' do
      have_many(:posts)
    end
    it 'has many comments' do
      have_many(:comments)
    end
    it 'has many likes' do
      have_many(:likes)
    end
  end

  describe 'validation' do
    it 'has a valid name value' do
      expect(subject).to be_valid
    end

    it 'has an invalid name value' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'has a posts_counter attribute greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#three_most_recent' do
    it 'should return recent posts' do
      expect(subject.three_most_recent_post.count).to eq(0)
    end
  end
end
