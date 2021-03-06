class ForumPost < ActiveRecord::Base

  validates_presence_of :forum_thread_id
  validates_presence_of :text, :message => "text must not be blank"
  validates_length_of :text, :within => 2..1000, :on => :create, :message => "must be a sane length"
  validate :does_not_contain_links

  belongs_to :user
  belongs_to :forum_thread, :dependent => :destroy, :counter_cache => :posts_count
  has_one :forum, :through => :forum_thread

  belongs_to :parent, :class_name => 'ForumPost'

protected

  def does_not_contain_links
    return if self.text.blank?
    if self.text =~ /http(s)?\:\/\// || self.text =~ /\[url\]/
      self.errors.add(:text, 'cannot contain links')
    end
  end

end
