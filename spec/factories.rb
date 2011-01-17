Factory.sequence :login do |i|
  "user#{i}"
end

Factory.sequence :email do |i|
  "user#{i}@watchlater.org"
end

Factory.define :user do |t|
  # t.login { Factory.next(:login) }
  t.email  { Factory.next(:email) }
  t.password 'topsecret123'
  t.password_confirmation 'topsecret123'
end

Factory.define :admin, :parent => :user do |t|
  # t.login 'admin'
  t.name 'Admin User'
  t.admin true
end

Factory.define :forum do |f|
  f.name "MyString"
  f.slug "MyString"
end

Factory.define :forum_post do |f|
  f.forum_thread_id 1
  f.user_id 1
  f.text "MyText"
end

Factory.define :forum_thread do |f|
  f.forum_id 1
  f.title "MyString"
end