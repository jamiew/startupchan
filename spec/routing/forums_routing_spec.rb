require "spec_helper"

describe ForumsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/forums" }.should route_to(:controller => "forums", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/forums/new" }.should route_to(:controller => "forums", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/forums/1" }.should route_to(:controller => "forums", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/forums/1/edit" }.should route_to(:controller => "forums", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/forums" }.should route_to(:controller => "forums", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/forums/1" }.should route_to(:controller => "forums", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/forums/1" }.should route_to(:controller => "forums", :action => "destroy", :id => "1")
    end

  end
end
