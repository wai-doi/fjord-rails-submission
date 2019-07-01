require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:doi)
    @other_user = users(:yusuke)
    @followee = users(:followee)
    @follower = users(:follower)
  end

  test 'GitHub APIのレスポンスからユーザーが作成されるか' do
    info = Struct.new(:email, :name).new('doi@example.com', 'doi')
    auth = Struct.new(:provider, :uid, :info).new('Github', '12345678', info)
    assert_instance_of User, User.from_omniauth(auth)
  end

  test 'new_with_sessionでemailが与えられたユーザーがつくられるか' do
    params = {}
    session = {"devise.github_data" => {"extra" => {"raw_info" => {"email" => 'hoge@example.com'}}}}
    user = User.new_with_session(params, session)
    assert_equal 'hoge@example.com', user.email
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
