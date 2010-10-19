require "spec_helper"

describe ForumThreadsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/forum_threads" }.should route_to(:controller => "forum_threads", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/forum_threads/new" }.should route_to(:controller => "forum_threads", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/forum_threads/1" }.should route_to(:controller => "forum_threads", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/forum_threads/1/edit" }.should route_to(:controller => "forum_threads", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/forum_threads" }.should route_to(:controller => "forum_threads", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/forum_threads/1" }.should route_to(:controller => "forum_threads", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/forum_threads/1" }.should route_to(:controller => "forum_threads", :action => "destroy", :id => "1")
    end

  end
end
