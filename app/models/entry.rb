class Entry < ActiveRecord::Base

  has_many :comments
  belongs_to :creator, :foreign_key => 'updated_by', :class_name => 'User'
  belongs_to :updater, :foreign_key => 'updated_by', :class_name => 'User'

  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_length_of :name, :within => 3..30, :on => :create, :message => "must not longer than 3 but shorter than 30 characters"

  before_validation :sluggify

  def to_param
    slug || id.to_s
  end

protected

  def sluggify
    self.slug = self.name.downcase.gsub(' ', '-')
  end
end
