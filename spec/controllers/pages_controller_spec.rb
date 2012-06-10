require 'spec_helper'

describe PagesController do

  render_views

  before(:each) do
    @base_title = "SelfServe "
  end

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get "about"
      response.should be_success
    end
  end

  describe "GET 'home'" do
    it "should have an Home title" do
      get "home"
      response.should have_selector("title", :content => @base_title + "Home")
    end
  end

  describe "GET 'contact'" do
    it "should have an Contact title" do
      get "contact"
      response.should have_selector("title", :content => @base_title + "Contact")
    end
  end

  describe "GET 'about'" do
    it "should have an About title" do
      get "about"
      response.should have_selector("title", :content => @base_title + "About")
    end
  end

  describe "GET 'help'" do
    it "should have an About title" do
      get "help"
      response.should have_selector("title", :content => @base_title + "Help")
    end
  end

end
