class ForumPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum_thread
  has_one :forum, :through => :forum_thread
  # TODO belongs_to/trough? vs delegate for :forum association

  belongs_to :parent, :class_name => 'ForumPost'

end
