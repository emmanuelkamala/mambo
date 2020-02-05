class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update, :delete, :destroy]
    before_action :authenticate_user!
    
    def index
        @posts = Post.all.order("created_at DESC")
        @post = Post.new
    end
    
    def show
    end
    
    def new
        @post = current_user.posts.build
    end
    
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path
        else
            render new_post_path
        end
    end
    
    def edit
    end
    
    def update
        if @post.update(post_params)
            flash[:notice] = "Post was successfully updated"
            redirect_to @post
          else
            render :edit
          end
    end
    
    def delete
    end
    
    def destroy
        @post.destroy
        flash[:notice] = "Post was successfully destroyed"
        redirect_to posts_path
    end
    
    private
      
       def set_post
          @post = Post.find(params[:id])
       end
    
       def post_params
            params.require(:post).permit(:content)
       end
    
    end
    