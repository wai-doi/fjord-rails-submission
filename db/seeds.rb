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

User.create!(
  email: "doi@example.com",
  password: 'doidoi',
  password_confirmation: 'doidoi',
  name: 'Doi',
  postcode: '1234567',
  address: '東京都',
  biography: 'よろしくお願いします'
)

5.times do |i|
  User.create!(
    email: "user#{i}@example.com",
    password: 'password',
    password_confirmation: 'password',
    name: "ユーザー#{i}",
    postcode: '1234567',
    address: '東京都',
    biography: 'よろしくお願いします'
  )
end
