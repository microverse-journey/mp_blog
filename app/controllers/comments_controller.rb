class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(
      post_id: params[:post_id],
      author_id: current_user.id,
      text: params['comment']['text']
    )

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to user_post_path(current_user, @comment.post)
    else
      flash[:alert] = "Oops! something went wrong. Comment couldn't be created"
      render :new
    end
  end
end
