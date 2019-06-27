require 'test_helper'
class ReportTest < ActiveSupport::TestCase
  test 'レポートがつくられる' do
    report = Report.new(title: '学習記録')
    assert report.save
  end
end
