class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @comment = current_user.comments.build(comment_params)       
        if @comment.save
            flash[:notice] = "Comment was successfully created"
            redirect_to posts_path
        else
            flash[:alert] = "Comment was not saved, Try again!"
            redirect_to posts_path
        end
    end
    
    private
    
       def comment_params
            params.require(:comment).permit(:comment, :post_id)
       end
end
