class AddPostsCountToForumThreads < ActiveRecord::Migration
  def up
    add_column :forum_threads, :posts_count, :integer, :null => false, :default => 0

    ForumThread.reset_column_information
    ForumThread.find(:all).each do |p|
      ForumThread.update_counters(p.id, :posts_count => p.forum_posts.count)
    end
  end

  def down
    remove_column :forum_threads, :posts_count
  end
end
