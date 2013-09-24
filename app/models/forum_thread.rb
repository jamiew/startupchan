class ForumThread < ActiveRecord::Base

  validates_presence_of :forum_id
  validates_presence_of :title
  validate :does_not_contain_links

  belongs_to :forum, :dependent => :destroy
  has_many :forum_posts

protected

  def does_not_contain_links
    return if self.title.blank?
    if self.title =~ /http(s)?\:\/\// || self.title =~ /\[url\]/
      self.errors.add(:text, 'cannot contain links')
    end
  end

end
