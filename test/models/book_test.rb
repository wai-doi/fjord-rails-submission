require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'タイトルのあるレポートはsaveされる' do
    report = Book.new(title: 'Rubyの教科書')
    assert report.save
  end

  test 'タイトルの無い書籍はsaveされない' do
    book = Book.new
    assert_not book.save
  end
end
