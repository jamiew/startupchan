class Forum < ActiveRecord::Base
  has_many :forum_threads
  has_many :forum_posts, :through => :forum_threads

  validates_presence_of :name, :message => "name must not be blank"
end
