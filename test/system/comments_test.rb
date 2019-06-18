require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  setup do
    @user = users(:doi)
    sign_in @user
    @report = reports(:valid)
  end

  test 'コメントを投稿する' do
    visit report_url(@report)
    fill_in '本文', with: 'ありがとうございます。'
    click_on '登録する'
    assert_text 'コメントを投稿しました。'
  end

  test 'コメントを削除する' do
    visit report_url(@report)
    fill_in '本文', with: 'ありがとうございます。'
    click_on '登録する'
    page.accept_confirm do
      click_on "削除", match: :first
    end
    assert_text 'コメントを削除しました。'
  end
end
