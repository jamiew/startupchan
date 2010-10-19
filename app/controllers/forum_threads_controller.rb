class ForumThreadsController < ApplicationController
  # GET /forum_threads
  # GET /forum_threads.xml
  def index
    @forum_threads = ForumThread.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forum_threads }
    end
  end

  # GET /forum_threads/1
  # GET /forum_threads/1.xml
  def show
    @forum_thread = ForumThread.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forum_thread }
    end
  end

  # GET /forum_threads/new
  # GET /forum_threads/new.xml
  def new
    @forum_thread = ForumThread.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forum_thread }
    end
  end

  # GET /forum_threads/1/edit
  def edit
    @forum_thread = ForumThread.find(params[:id])
  end

  # POST /forum_threads
  # POST /forum_threads.xml
  def create
    @forum_thread = ForumThread.new(params[:forum_thread])

    respond_to do |format|
      if @forum_thread.save
        format.html { redirect_to(@forum_thread, :notice => 'Forum thread was successfully created.') }
        format.xml  { render :xml => @forum_thread, :status => :created, :location => @forum_thread }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forum_thread.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forum_threads/1
  # PUT /forum_threads/1.xml
  def update
    @forum_thread = ForumThread.find(params[:id])

    respond_to do |format|
      if @forum_thread.update_attributes(params[:forum_thread])
        format.html { redirect_to(@forum_thread, :notice => 'Forum thread was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forum_thread.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_threads/1
  # DELETE /forum_threads/1.xml
  def destroy
    @forum_thread = ForumThread.find(params[:id])
    @forum_thread.destroy

    respond_to do |format|
      format.html { redirect_to(forum_threads_url) }
      format.xml  { head :ok }
    end
  end
end
