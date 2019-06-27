class Users::FollowingsController < ApplicationController
  def index
    @followings = User.find(params[:user_id]).followings
    render 'users/followings'
  end
end
