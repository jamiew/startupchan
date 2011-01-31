class ApplicationController < ActionController::Base

  before_filter :get_sidebar_content

  protect_from_forgery

  rescue_from PermissionDenied, :with => :permission_denied


protected

  def get_sidebar_content
    # TEMP disabled for now
    @recent_threads = [] #ForumThread.order('created_at DESC').limit(5)
    @recent_entries = [] #Entry.order('name DESC').limit(5)
  end

  def permission_denied
    render :text => "Permission denied", :layout => true, :status => 403
  end
end
