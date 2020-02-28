class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        # @comment = @post.comments.build(params[:comment][:post_id]) 
        # @comment = Comment.new(comment_params)
        # @comment.user_id = current_user.id if user_signed_in?
        @comment = current_user.comments.build(comment_params)       
        @comment.post_id = params[:post_id]
        @comment.user = current_user
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
