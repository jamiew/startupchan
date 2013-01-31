FactoryGirl.define do

  sequence :login do |i|
    "user#{i}"
  end

  sequence :email do |i|
    "user#{i}@watchlater.org"
  end

  factory :user do |t|
    # t.login { FactoryGirl.generate(:login) }
    t.email  { FactoryGirl.generate(:email) }
    t.password 'topsecret123'
    t.password_confirmation 'topsecret123'
  end

  factory :admin, :parent => :user do |t|
    # t.login 'admin'
    t.name 'Admin User'
    t.admin true
  end

  factory :forum do |f|
    f.name "MyString"
    f.slug "MyString"
  end

  factory :forum_post do |f|
    f.forum_thread_id 1
    f.user_id 1
    f.text "MyText"
  end

  factory :forum_thread do |f|
    f.forum_id 1
    f.title "MyString"
  end

end