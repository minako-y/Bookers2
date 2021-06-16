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
    if user.update(user_prams)
      redirect_to user_path(user), notice: "You have updated user successfully."
    else
      @user = user
      render :edit
    end
  end

 private
  def user_prams
    params.require(:user).permit(:name, :profile_image_id,:introduction)
  end

end
