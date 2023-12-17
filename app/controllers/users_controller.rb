class UsersController < ApplicationController
  def show
    @user = current_user
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
    flash[:notice] = "You have updated user successfully."
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
