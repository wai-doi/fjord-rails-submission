require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:doi)
    sign_in @user
    @report = reports(:valid)
  end

  test "一覧画面を表示" do
    visit reports_url
    assert_selector "h1", text: "レポート"
  end

  test "新規レポートを作る" do
    visit reports_url
    click_on "新規 レポート"

    fill_in "タイトル", with: 'データベース学習'
    fill_in "本文", with: '課題を進めた。'
    click_on "登録する"

    assert_text "Report was successfully created"
  end

  test "レポートを編集する" do
    visit reports_url
    click_on "編集", match: :smart

    fill_in "タイトル", with: 'データベース学習'
    fill_in "本文", with: '課題を進めた。'
    click_on "更新する"

    assert_text "Report was successfully updated"
  end

  test "レポートを削除する" do
    visit reports_url
    page.accept_confirm do
      click_on "削除", match: :smart
    end

    assert_text "Report was successfully destroyed"
  end
end
