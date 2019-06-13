class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to root_url
    else
      redirect_to edit_user_registration_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :postcode, :address, :biography)
  end
end
