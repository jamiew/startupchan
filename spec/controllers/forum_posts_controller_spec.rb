require 'spec_helper'

describe ForumPostsController do

  def mock_forum_post(stubs={})
    (@mock_forum_post ||= mock_model(ForumPost).as_null_object).tap do |forum_post|
      forum_post.forum_id = 1
      forum_post.stub(stubs) unless stubs.empty?
      forum_post.parent_id ||= 0
    end
  end

  describe "GET index" do
    it "assigns all forum_posts as @forum_posts" do
      ForumPost.stub(:all) { [mock_forum_post] }
      get :index
      assigns(:forum_posts).should eq([mock_forum_post])
    end
  end

  describe "GET show" do
    it "assigns the requested forum_post as @forum_post" do
      ForumPost.stub(:find).with("37") { mock_forum_post }
      get :show, :id => "37"
      assigns(:forum_post).should be(mock_forum_post)
    end
  end

  describe "GET new" do
    it "assigns a new forum_post as @forum_post" do
      ForumPost.stub(:new) { mock_forum_post }
      get :new
      assigns(:forum_post).should be(mock_forum_post)
    end
  end

  describe "GET edit" do
    it "assigns the requested forum_post as @forum_post" do
      ForumPost.stub(:find).with("37") { mock_forum_post }
      get :edit, :id => "37"
      assigns(:forum_post).should be(mock_forum_post)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created forum_post as @forum_post" do
        ForumPost.stub(:new).with({'these' => 'params', 'parent_id' => 0}) { mock_forum_post(:save => true) }
        post :create, :forum_post => {'these' => 'params'}
        assigns(:forum_post).should be(mock_forum_post)
      end

      it "redirects to the created forum_post" do
        ForumPost.stub(:new) { mock_forum_post(:save => true) }
        post :create, :forum_post => {}
        response.should redirect_to(forum_post_url(mock_forum_post))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved forum_post as @forum_post" do
        ForumPost.stub(:new).with({'these' => 'params', 'parent_id' => 0}) { mock_forum_post(:save => false) }
        post :create, :forum_post => {'these' => 'params'}
        assigns(:forum_post).should be(mock_forum_post)
      end

      it "re-renders the 'new' template" do
        ForumPost.stub(:new) { mock_forum_post(:save => false) }
        post :create, :forum_post => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested forum_post" do
        ForumPost.should_receive(:find).with("37") { mock_forum_post }
        mock_forum_post.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :forum_post => {'these' => 'params'}
      end

      it "assigns the requested forum_post as @forum_post" do
        ForumPost.stub(:find) { mock_forum_post(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:forum_post).should be(mock_forum_post)
      end

      it "redirects to the forum_post" do
        ForumPost.stub(:find) { mock_forum_post(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(forum_post_url(mock_forum_post))
      end
    end

    describe "with invalid params" do
      it "assigns the forum_post as @forum_post" do
        ForumPost.stub(:find) { mock_forum_post(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:forum_post).should be(mock_forum_post)
      end

      it "re-renders the 'edit' template" do
        ForumPost.stub(:find) { mock_forum_post(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested forum_post" do
      ForumPost.should_receive(:find).with("37") { mock_forum_post }
      mock_forum_post.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the forum_posts list" do
      ForumPost.stub(:find) { mock_forum_post }
      delete :destroy, :id => "1"
      response.should redirect_to(forum_posts_url)
    end
  end

end
