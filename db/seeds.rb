# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

user = User.create!(:email => "demo@example.com", :password => "secret", :password_confirmation => "secret")
user = User.create!(:email => "jamie@tramchase.com", :password => "secret", :password_confirmation => "secret")

forum = Forum.find_or_create_by_name("General")

puts "thread 1..."
thread = ForumThread.create!(:forum => forum, :title => "First thread")
  post = ForumPost.create!(:forum_thread => thread, :text => "Sup guys what thing should I get")
    reply = ForumPost.create!(:forum_thread => thread, :parent => post, :text => "Lol that is a funny thing")
    reply2 = ForumPost.create!(:forum_thread => thread, :parent => reply, :text => "I'm replyin to your reply")
    reply3 = ForumPost.create!(:forum_thread => thread, :parent => reply2, :text => "Your reply was very stupid")
    video_reply = ForumPost.create!(:forum_thread => thread, :text => "http://youtube.com/watch?v=pcPGL-VW7w4 Yeah that's a video")
    image_reply = ForumPost.create(:forum_thread => thread, :text => "Use this http://localhost/quotable-kanye/images/frame2-550.png")
    long_reply = ForumPost.create!(:forum_thread => thread, :text => "I am an extremely long reply that is not saying much more than something that as shorter & more concise. I should know my lesson since nobody will reply to this, because it is a book")
    html_reply = ForumPost.create!(:forum_thread => thread, :text => "I'm trying to <b>haxor</b> <a href=http://cnn.com>your</a> <img src='http://cnn.com'> your base")

puts "thread 2..."
thread = ForumThread.create!(:forum => forum, :title => "Second thread y'allllllll SUP #hastag")
  post = ForumPost.create!(:forum_thread => thread, :text => "wtf do u think you are doing with that hashtag")
  post = ForumPost.create!(:forum_thread => thread, :text => "oh yeah how about some fuckin [[InlineLinks]]")
  post = ForumPost.create!(:forum_thread => thread, :text => "your wikistyle is whack let's try some CamelCase as a link to HowToDoSomething")


puts "Done"