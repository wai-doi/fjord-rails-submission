class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to root_url
    else
      redirect_to edit_user_registration_url
    end
  end

  def following
    @user = User.find(params[:id])
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :postcode, :address, :biography, :image)
  end
end
