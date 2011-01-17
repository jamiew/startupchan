class ApplicationController < ActionController::Base

  before_filter :get_sidebar_content

  protect_from_forgery

protected

  def get_sidebar_content
    @recent_threads = ForumThread.order('created_at DESC').limit(5)
    @recent_entries = Entry.order('name DESC').limit(5)
  end
end
