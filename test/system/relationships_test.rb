require 'application_system_test_case'

class RelationshipsTest < ApplicationSystemTestCase
  setup do
    @user = users(:doi)
    sign_in @user
  end

  test 'ユーザーをフォローしてフォローをはずす' do
    visit users_url
    click_on 'Follow', match: :first
    assert_equal 1, @user.followings.count

    visit users_url
    click_on 'Unfollow', match: :first
    assert_equal 0, @user.followings.count
  end
end
