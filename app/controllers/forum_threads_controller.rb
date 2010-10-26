class ForumThreadsController < ApplicationController

  # GET /forum_threads
  # GET /forum_threads.xml
  def index
    @threads = ForumThread.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @threads }
    end
  end

  # GET /forum_threads/1
  # GET /forum_threads/1.xml
  def show
    @thread = ForumThread.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thread }
    end
  end

  # GET /forum_threads/new
  # GET /forum_threads/new.xml
  def new
    @thread = ForumThread.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thread }
    end
  end

  # GET /forum_threads/1/edit
  def edit
    @thread = ForumThread.find(params[:id])
  end

  # POST /forum_threads
  # POST /forum_threads.xml
  def create

    # Hard-coded forum ID... we only have 1
    params[:forum_thread] && params[:forum_thread][:forum_id] = 1
    @thread = ForumThread.new(params[:forum_thread])

    respond_to do |format|
      if @thread.save
        format.html { redirect_to(@thread.forum, :notice => 'Forum thread was successfully created.') }
        format.xml  { render :xml => @thread, :status => :created, :location => @thread }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thread.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forum_threads/1
  # PUT /forum_threads/1.xml
  def update
    @thread = ForumThread.find(params[:id])

    respond_to do |format|
      if @thread.update_attributes(params[:forum_thread])
        format.html { redirect_to(@thread, :notice => 'Forum thread was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thread.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_threads/1
  # DELETE /forum_threads/1.xml
  def destroy
    @thread = ForumThread.find(params[:id])
    @thread.destroy

    respond_to do |format|
      format.html { redirect_to(forum_threads_url) }
      format.xml  { head :ok }
    end
  end
end
