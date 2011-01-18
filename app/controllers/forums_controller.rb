class ForumsController < ApplicationController
  # GET /forums
  # GET /forums.xml
  def index
    @forums = Forum.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forums }
    end
  end

  # GET /forums/1
  # GET /forums/1.xml
  def show
    @forum = Forum.find(params[:id])
    @threads = @forum.forum_threads.order('created_at DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forum }
    end
  end

  def search
    render :text => "Search is TODO!", :layout => !request.xhr?
  end

end
