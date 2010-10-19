require 'spec_helper'

describe ForumThreadsController do

  def mock_forum_thread(stubs={})
    (@mock_forum_thread ||= mock_model(ForumThread).as_null_object).tap do |forum_thread|
      forum_thread.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all forum_threads as @forum_threads" do
      ForumThread.stub(:all) { [mock_forum_thread] }
      get :index
      assigns(:forum_threads).should eq([mock_forum_thread])
    end
  end

  describe "GET show" do
    it "assigns the requested forum_thread as @forum_thread" do
      ForumThread.stub(:find).with("37") { mock_forum_thread }
      get :show, :id => "37"
      assigns(:forum_thread).should be(mock_forum_thread)
    end
  end

  describe "GET new" do
    it "assigns a new forum_thread as @forum_thread" do
      ForumThread.stub(:new) { mock_forum_thread }
      get :new
      assigns(:forum_thread).should be(mock_forum_thread)
    end
  end

  describe "GET edit" do
    it "assigns the requested forum_thread as @forum_thread" do
      ForumThread.stub(:find).with("37") { mock_forum_thread }
      get :edit, :id => "37"
      assigns(:forum_thread).should be(mock_forum_thread)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created forum_thread as @forum_thread" do
        ForumThread.stub(:new).with({'these' => 'params'}) { mock_forum_thread(:save => true) }
        post :create, :forum_thread => {'these' => 'params'}
        assigns(:forum_thread).should be(mock_forum_thread)
      end

      it "redirects to the created forum_thread" do
        ForumThread.stub(:new) { mock_forum_thread(:save => true) }
        post :create, :forum_thread => {}
        response.should redirect_to(forum_thread_url(mock_forum_thread))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved forum_thread as @forum_thread" do
        ForumThread.stub(:new).with({'these' => 'params'}) { mock_forum_thread(:save => false) }
        post :create, :forum_thread => {'these' => 'params'}
        assigns(:forum_thread).should be(mock_forum_thread)
      end

      it "re-renders the 'new' template" do
        ForumThread.stub(:new) { mock_forum_thread(:save => false) }
        post :create, :forum_thread => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested forum_thread" do
        ForumThread.should_receive(:find).with("37") { mock_forum_thread }
        mock_forum_thread.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :forum_thread => {'these' => 'params'}
      end

      it "assigns the requested forum_thread as @forum_thread" do
        ForumThread.stub(:find) { mock_forum_thread(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:forum_thread).should be(mock_forum_thread)
      end

      it "redirects to the forum_thread" do
        ForumThread.stub(:find) { mock_forum_thread(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(forum_thread_url(mock_forum_thread))
      end
    end

    describe "with invalid params" do
      it "assigns the forum_thread as @forum_thread" do
        ForumThread.stub(:find) { mock_forum_thread(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:forum_thread).should be(mock_forum_thread)
      end

      it "re-renders the 'edit' template" do
        ForumThread.stub(:find) { mock_forum_thread(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested forum_thread" do
      ForumThread.should_receive(:find).with("37") { mock_forum_thread }
      mock_forum_thread.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the forum_threads list" do
      ForumThread.stub(:find) { mock_forum_thread }
      delete :destroy, :id => "1"
      response.should redirect_to(forum_threads_url)
    end
  end

end
