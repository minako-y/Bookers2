class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(current_user.id)
    user.update(user_prams)
    redirect_to user_path(user)
  end

 private
  def user_prams
    params.require(:user).permit(:name, :profile_image_id,:introduction)
  end

end
