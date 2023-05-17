require 'rails_helper'

RSpec.describe 'User Posts', type: :request do
  let(:author) { User.create(name: 'Harry Potter', photo: 'http://tactes.com/image', bio: 'User bio', posts_counter: 0) }

  subject do
    Post.create(author:, title: 'post title',
                text: 'The system test directory holds system tests.', comments_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  describe 'GET /users/:id' do
    it 'should return http success' do
      get "/users/#{author.id}"
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'should return http success' do
      get "/users/#{author.id}/posts/#{subject.id}"

      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
end
