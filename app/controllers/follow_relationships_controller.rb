class FollowRelationshipsController < ApplicationController
  def create
    @user = User.find(params[:follow_relationship][:following_id])
    current_user.follow!(@user)
    redirect_to users_url
  end

  def destroy
    @user = FollowRelationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_back(fallback_location: '/')
  end
end
