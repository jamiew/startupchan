class AddForumIndexes < ActiveRecord::Migration
  def self.up
    add_index :entries, :slug
    add_index :forum_posts, :forum_thread_id
  end

  def self.down
    remove_index :entries, :slug
    remove_index :forum_posts, :forum_thread_id
  end
end
