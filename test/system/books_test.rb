require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @user = users(:doi)
    sign_in @user
    @book = books(:valid)
  end

  test "一覧画面" do
    visit books_url
    assert_selector "h1", text: "書籍"
  end

  test "新規書籍を作る" do
    visit books_url
    click_on "新規 書籍"

    fill_in "タイトル", with: 'Ruby超入門'
    fill_in "メモ", with: '初心者にやさしい本です。'
    click_on "登録する"

    assert_text "Book was successfully created"
  end

  test "書籍を編集する" do
    visit books_url
    click_on "編集", match: :smart

    fill_in "タイトル", with: 'Ruby超入門'
    fill_in "メモ", with: '初心者にやさしい本です。'
    click_on "更新する"

    assert_text "Book was successfully updated"
  end

  test "書籍を削除する" do
    visit books_url
    page.accept_confirm do
      click_on "削除", match: :smart
    end

    assert_text "Book was successfully destroyed"
  end
end
