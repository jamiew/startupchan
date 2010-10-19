class AddParentIdToForumPosts < ActiveRecord::Migration
  def self.up
    add_column :forum_posts, :parent_id, :integer
    add_index :forum_posts, :parent_id
  end

  def self.down
    remove_column :forum_posts, :parent_id
  end
end
