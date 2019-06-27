require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @report = reports(:valid)
  end

  test 'コメントがつくられる' do
    comment = @report.comments.new(body: 'がんばりましょう')
    assert comment.save
  end
end
