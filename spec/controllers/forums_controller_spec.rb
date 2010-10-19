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

  describe "GET edit" do
    it "assigns the requested forum as @forum" do
      Forum.stub(:find).with("37") { mock_forum }
      get :edit, :id => "37"
      assigns(:forum).should be(mock_forum)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created forum as @forum" do
        Forum.stub(:new).with({'these' => 'params'}) { mock_forum(:save => true) }
        post :create, :forum => {'these' => 'params'}
        assigns(:forum).should be(mock_forum)
      end

      it "redirects to the created forum" do
        Forum.stub(:new) { mock_forum(:save => true) }
        post :create, :forum => {}
        response.should redirect_to(forum_url(mock_forum))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved forum as @forum" do
        Forum.stub(:new).with({'these' => 'params'}) { mock_forum(:save => false) }
        post :create, :forum => {'these' => 'params'}
        assigns(:forum).should be(mock_forum)
      end

      it "re-renders the 'new' template" do
        Forum.stub(:new) { mock_forum(:save => false) }
        post :create, :forum => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested forum" do
        Forum.should_receive(:find).with("37") { mock_forum }
        mock_forum.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :forum => {'these' => 'params'}
      end

      it "assigns the requested forum as @forum" do
        Forum.stub(:find) { mock_forum(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:forum).should be(mock_forum)
      end

      it "redirects to the forum" do
        Forum.stub(:find) { mock_forum(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(forum_url(mock_forum))
      end
    end

    describe "with invalid params" do
      it "assigns the forum as @forum" do
        Forum.stub(:find) { mock_forum(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:forum).should be(mock_forum)
      end

      it "re-renders the 'edit' template" do
        Forum.stub(:find) { mock_forum(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested forum" do
      Forum.should_receive(:find).with("37") { mock_forum }
      mock_forum.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the forums list" do
      Forum.stub(:find) { mock_forum }
      delete :destroy, :id => "1"
      response.should redirect_to(forums_url)
    end
  end

end
