class Users::FollowersController < ApplicationController
  def index
    @followers = User.find(params[:user_id]).followers
    render 'users/followers'
  end
end
