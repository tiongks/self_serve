require 'spec_helper'

describe PagesController do

  render_views

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
      get "about"
      response.should have_selector("title", :content => "SelfServe - Home")
    end
  end

  describe "GET 'contact'" do
    it "should have an Contact title" do
      get "about"
      response.should have_selector("title", :content => "SelfServe - Contact")
    end
  end

  describe "GET 'about'" do
    it "should have an About title" do
      get "about"
      response.should have_selector("title", :content => "SelfServe - About")
    end
  end

end
