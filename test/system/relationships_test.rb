require 'application_system_test_case'

class RelationshipsTest < ApplicationSystemTestCase
  setup do
    @user = users(:doi)
    sign_in @user
  end

  test 'ユーザーをフォローしてフォローをはずす' do
    visit users_url
    click_on 'Follow', match: :first
    visit user_url(@user)
    assert_selector '#followings-count', text: '1'

    visit users_url
    click_on 'Unfollow', match: :first
    visit user_url(@user)
    assert_selector '#followings-count', text: '0'
  end
end
