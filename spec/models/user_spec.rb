require 'spec_helper'

describe User do
  
	before(:each) do
	  @attr = { :first_name => "test user", :user_name => "test", :email => "test@mail.com" }
	end

	it "should create a new record" do
	  User.create!(@attr)
	end
	
	it "should require a first_name" do
		invalid_user = User.new( :email => "test@mail.com" )
		invalid_user.should_not be_valid
	end
	
	it "should require a email" do
		invalid_user = User.new( :first_name => "test" )
		invalid_user.should_not be_valid
	end
	
	it "should require an email and first_name" do
		invalid_user = User.new
		invalid_user.should_not be_valid
	end
end
