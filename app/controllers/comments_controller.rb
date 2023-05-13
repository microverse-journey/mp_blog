class CommentsController < ApplicationController
  
    def new
      @comment = Comment.new
    end
  
    def create
      @post = Comment.new(
        post_id: params[:id],
        title: params['post']['title'],
        text: params['post']['text']
      )
  
      if(@post.save)
        flash[:success] = 'Post created successfully'
        redirect_to user_path(current_user)
      else
        flash[:alert] = "Oops! something went wrong. Post couldn't be created"
        render :new
      end
    end
  
  end
  