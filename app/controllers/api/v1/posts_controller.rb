class API::V1::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    render json: @user.posts.includes(comments: :author)
  end

end
