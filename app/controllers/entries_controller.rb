class EntriesController < ApplicationController

  before_filter :find_entry, :only => [:show, :new, :edit, :update, :destroy]
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
  end

  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to(@entry, :notice => 'Entry was successfully created.') }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(@entry, :notice => 'Entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.xml  { head :ok }
    end
  end


  protected

  # Lookup entry by numeric ID or name string
  def find_entry
    id = params[:id]
    if /\A\d+\z/.match(id)
      @entry = Entry.find(id)
    else
      @entry = Entry.find_by_name(id)
    end
    raise ActiveRecord::RecordNotFound if @entry.nil?
  end

  def create_new_entry_prompt
    name = params[:id]
    @entry = Entry.new(:name => name)
    flash[:notice] = "An entry for #{name.inspect} doesn't exist yet! Go ahead and create it now..."
    render 'new', :name => name
  end
end
