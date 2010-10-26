require 'spec_helper'

describe ForumsController do

  def mock_forum(stubs={})
    (@mock_forum ||= mock_model(Forum).as_null_object).tap do |forum|
      forum.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all forums as @forums" do
      Forum.stub(:all) { [mock_forum] }
      get :index
      assigns(:forums).should eq([mock_forum])
    end
  end

  describe "GET show" do
    it "assigns the requested forum as @forum" do
      Forum.stub(:find).with("37") { mock_forum }
      get :show, :id => "37"
      assigns(:forum).should be(mock_forum)
    end
  end

  describe "GET new" do
    it "assigns a new forum as @forum" do
      Forum.stub(:new) { mock_forum }
      get :new
      assigns(:forum).should be(mock_forum)
    end
  end

end
