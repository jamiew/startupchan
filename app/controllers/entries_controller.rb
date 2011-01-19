class EntriesController < ApplicationController

  before_filter :get_entry, :only => [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :create_new_entry_prompt


  def index
    @entries = Entry.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @entries }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @entry }
    end
  end

  def new
    @entry = Entry.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @entry }
    end
  end

  def edit
    raise PermissionDenied unless current_user && current_user.can_edit?(@entry)
  end

  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to(@entry, :notice => 'Created!') }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    raise PermissionDenied unless current_user && current_user.can_edit?(@entry)
    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(@entry, :notice => 'Updated!') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    raise PermissionDenied unless is_admin?
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.xml  { head :ok }
    end
  end


protected

  # Lookup entry by numeric ID -or- slug string
  def get_entry
    id = params[:id]
    if /\A\d+\z/.match(id)
      @entry = Entry.find(id)
    else
      @entry = Entry.find_by_slug(id)
    end
    raise ActiveRecord::RecordNotFound if @entry.nil?
  end

  # Don't throw a 404 -- let people create a new entry!
  def create_new_entry_prompt
    name = params[:id]
    @entry = Entry.new(:name => name)
    logger.info "create_new_entry_prompt...?"
    flash[:notice] = "An entry for #{name.inspect} doesn't exist yet! Go ahead and create it now..."
    render 'new', :name => name
  end
end
