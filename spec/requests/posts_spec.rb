require 'rails_helper'

RSpec.describe 'User Posts', type: :request do
  describe 'GET /users/:id/posts' do
    it 'should return http success' do
      get '/users/1/posts'
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('All User Posts')
    end
  end

  describe 'GET /users/:id/posts/id' do
    it 'should return http success' do
      get '/users/1/posts/1'

      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('User Single Post')
    end
  end
end
