class ForumPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum_thread
  has_one :forum, :through => :forum_thread
  # TODO belongs_to/trough? vs delegate for :forum association

  belongs_to :parent, :class_name => 'ForumPost'

  validates_presence_of :text, :message => "text must not be blank"
  validates_length_of :text, :within => 2..1000, :on => :create, :message => "must be of sane length"

end
