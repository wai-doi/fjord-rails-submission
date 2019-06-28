require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:doi)
    @other_user = users(:yusuke)
    @followee = users(:followee)
    @follower = users(:follower)
  end

  test 'フォローしているか' do
    assert @followee.following?(@follower)
  end

  test 'フォローしていないか' do
    assert_not @user.following?(@other_user)
  end

  test 'フォローする' do
    @user.follow!(@other_user)
    assert @followee.following?(@follower)
  end

  test 'フォローを外す' do
    @followee.unfollow!(@follower)
    assert_not @followee.following?(@follower)
  end
end
