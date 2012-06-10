require 'spec_helper'

describe "LayoutLinks" do

  before(:each) do
    @base_title = "SelfServe "
  end

  #describe "GET /layout_links" do
  #  it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get layout_links_index_path
    #  response.status.should be(200)
    #end
  #end

  describe "GET /" do
    it "should have a Home page at /" do
      get "/"
      response.status.should be(200)
    end
  end

  describe "GET /home" do
    it "should have a Home page at /home" do
      get "/home"
      response.should have_selector('title', :content => @base_title + "Home")
    end
  end

  describe "GET /contact" do
    it "should have a Contact page at /contact" do
      get "/contact"
      response.should have_selector('title', :content => @base_title + "Contact")
    end
  end

  describe "GET /about" do
    it "should have a Users page at /about" do
      get "/about"
      response.should have_selector('title', :content => @base_title + "About")
      #response.status.should be(200)
    end
  end

end
