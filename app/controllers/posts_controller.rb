class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: :author)
  end

  def show
    @post = Post.includes(comments: :author).find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(
      author_id: current_user.id,
      title: params['post']['title'],
      text: params['post']['text']
    )

    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Oops! something went wrong. Post couldn't be created"
      render :new
    end
  end
end
