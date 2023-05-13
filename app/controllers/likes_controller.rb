class LikesController < ApplicationController
  
    def create
      @like = Like.new(
        post_id: params[:post_id],
        author_id: current_user.id,
      )

      if(@like.save)
        flash.now[:success] = 'Post Liked successfully'
        redirect_to user_post_path(current_user, @like.post)
      else
        flash[:alert] = "Oops! something went wrong."
        render :new
      end
    end
  
end
  