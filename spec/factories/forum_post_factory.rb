# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :forum_post do |f|
  f.forum_thread_id 1
  f.user_id 1
  f.text "MyText"
end
