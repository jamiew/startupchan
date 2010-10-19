class ForumThread < ActiveRecord::Base
  belongs_to :forum
  has_many :forum_posts
end
