require "spec_helper"

describe UsersController do

  render_views

  describe "GET 'new'" do

    before :each do
      @user = Factory(:user)
    end

    it "should be successful" do
      get 'new'
      response.should be_successful
    end

    it "should bring up the right page" do
      get 'new'
      response.should have_selector('title', :content => "SelfServe")
    end

    it "should highlight the user's name'" do
      get :show, :id => @user
      response.should have_selector('h1', :content => @user.user_name)
    end

    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector('h1>img', :class => "gravatar")
    end
  end
end