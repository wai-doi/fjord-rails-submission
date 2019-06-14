100.times do |i|
  Book.create!(
    title: "タイトル#{i}",
    memo: "#{i}番目の本です"
  )
end

100.times do |i|
  Report.create!(
    title: "タイトル#{i}",
    body: "#{i}番目のレポートです"
  )
end
