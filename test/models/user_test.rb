require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'ユーザーの登録ができる' do
    user = User.new(email: 'hoge@sample.com', password: 'hogehoge')
    assert user.save
  end
end
