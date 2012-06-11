require 'spec_helper'

describe User do
  
	before(:each) do
	  @attr = { :first_name => "test user", :user_name => "test", :email => "test@mail.com" }
	end

	it "should create a new record" do
	  User.create!(@attr)
	end
	
	it "should require a user_name" do
		invalid_user = User.new( :email => "test@mail.com" )
		invalid_user.should_not be_valid
	end
	
	it "should require a email" do
		invalid_user = User.new( :user_name => "test" )
		invalid_user.should_not be_valid
	end
	
	it "should require an email and user_name" do
		invalid_user = User.new
		invalid_user.should_not be_valid
	end

	it "should reject long user_name" do
		long_name = "a" * 51
		long_name_user = User.new :user_name => long_name
		long_name_user.should_not be_valid
	end

	it "should only accept valid email addresses" do
		addresses = %w[user.foo@com user.foo.com user@]
		addresses.each do | address |
			invalid_user = User.new :user_name => "test", :email => address
			invalid_user.should_not be_valid
		end
	end

	it "should reject duplicate email addresses" do
		user1 = User.create :user_name => "test1", :email => @attr[:email]
		user2 = User.create :user_name => "test2", :email => @attr[:email]
		user2.should_not be_valid
	end

	it "should reject duplicate email addresses regardless of case" do
		upcase_email = @attr[:email].upcase
		user1 = User.create :user_name => "test1", :email => upcase_email
		user2 = User.create :user_name => "test2", :email => @attr[:email]
		user2.should_not be_valid
	end

	it "should reject duplicate user names" do
		user1 = User.create :user_name => "test", :email => "email1@test.com"
		user2 = User.create :user_name => "test", :email => "email2@test.com"
		user2.should_not be_valid
	end
end
