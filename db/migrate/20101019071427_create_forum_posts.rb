class CreateForumPosts < ActiveRecord::Migration
  def self.up
    create_table :forum_posts do |t|
      t.integer :forum_thread_id
      t.integer :user_id
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :forum_posts
  end
end
