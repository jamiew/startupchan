# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

forum = Forum.create!(:name => "General" )
thread = ForumThread.create!(:forum => forum, :title => "First thread")
post = ForumPost.create!(:thread => thread, :text => "Sup guys what thing should I get")
reply = ForumPost.create!(:thread => thread, :parent => post, :text => "Lol that is a funny thing")
video_reply = ForumPost.create!(:thread => thread, :text => "http://youtube.com/watch?v=pcPGL-VW7w4 Yeah that's a video")
image_reply = ForumPost.create(:thread => thread, :text => "Use this http://localhost/quotable-kanye/images/frame2-550.png")
reply2 = ForumPost.create!(:thread => thread, :parent => reply, :text => "I'm replyin to your reply")
reply3 = ForumPost.create!(:thread => thread, :parent => reply2, :text => "Your reply was very stupid")
long_reply = ForumPost.create!(:thread => thread, :text => "I am an extremely long reply that is not saying much more than something that as shorter & more concise. I should know my lesson since nobody will reply to this, because it is a book")
html_reply = ForumPost.create!(:thread => thread, :text => "I'm trying to <b>haxor</b> <a href=http://cnn.com>your</a> <img src='http://cnn.com'> your base")
