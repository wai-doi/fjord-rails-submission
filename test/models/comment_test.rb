require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @report = reports(:valid)
  end

  test '本文のあるコメントはつくれる' do
    comment = @report.comments.new(body: 'がんばりましょう')
    assert comment.save
  end

  test '本文の無いコメントはつくれない' do
    comment = @report.comments.new
    assert_not comment.save
  end
end
