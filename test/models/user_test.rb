require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'ユーザーの登録ができる' do
    user = User.new(email: 'hoge@sample.com', password: 'hogehoge')
    assert user.save
  end

  test 'emailの無いユーザは登録できない' do
    user = User.new(password: 'hogehoge')
    assert_not user.save
  end

  test 'パスワードの無いユーザは登録できない' do
    user = User.new(email: 'hoge@sample.com')
    assert_not user.save
  end
end
