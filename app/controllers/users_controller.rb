class UsersController < ApplicationController
    before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @post = Post.new
    @users = User.all
    @user = User.find_by(id: params[:id])
    @myposts = Post.where(user_id: current_user)
  end
end
