class UsersController < ApplicationController
  def index
    @users = User.all
    # @user = User.find(params[:id])
  end

  def show
    @blogs = Blog.all
    @user = current_user
  end
end
