require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'Bookがつくられる' do
    report = Book.new(title: 'Rubyの教科書')
    assert report.save
  end
end
