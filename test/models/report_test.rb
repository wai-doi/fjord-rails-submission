require 'test_helper'
class ReportTest < ActiveSupport::TestCase
  test 'タイトルのあるレポートはsaveされる' do
    report = Report.new(title: '学習記録')
    assert report.save
  end

  test 'タイトルの無いレポートはsaveされない' do
    report = Report.new
    assert_not report.save
  end
end
