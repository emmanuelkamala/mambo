class UsersController < ApplicationController
    before_action :authenticate_user!

  def index
    @users = User.where('id != ?', current_user.id)
    
  end

  def show
    @post = Post.new
    @users = User.all
    @user = User.find_by(id: params[:id])
    @myposts = Post.where(user_id: @user.id)
  end
end
