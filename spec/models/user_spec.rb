require 'spec_helper'

describe User do
  
	before(:each) do
	  @attr = { :first_name => "test user", :user_name => "test", :email => "test@mail.com" }
	end

	it "should create a new record" do
	  new_attr = @attr
		new_attr[:pass_phrase] = "passphrase"
    new_attr[:pass_phrase_confirmation] = new_attr[:pass_phrase]
	  User.create!(new_attr)
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
			invalid_user = User.new :user_name => "test", :email => address, :pass_phrase => "pass"
			invalid_user.should_not be_valid
		end
	end

	it "should reject duplicate email addresses" do
		user1 = User.create :user_name => "test1", :email => @attr[:email], :pass_phrase => "pass"
		user2 = User.create :user_name => "test2", :email => @attr[:email], :pass_phrase => "pass"
		user2.should_not be_valid
	end

	it "should reject duplicate email addresses regardless of case" do
		upcase_email = @attr[:email].upcase
		user1 = User.create :user_name => "test1", :email => upcase_email, :pass_phrase => "pass"
		user2 = User.create :user_name => "test2", :email => @attr[:email], :pass_phrase => "pass"
		user2.should_not be_valid
	end

	it "should reject duplicate user names" do
		user1 = User.create :user_name => "test", :email => "email1@test.com", :pass_phrase => "passone"
		user2 = User.create :user_name => "test", :email => "email2@test.com", :pass_phrase => "passtwo"
		user2.should_not be_valid
	end

	it "should require a password" do
	  new_attr = @attr
		new_attr[:pass_phrase] = "passphrase"
    new_attr[:pass_phrase_confirmation] = new_attr[:pass_phrase]
		User.create! new_attr
	end

	it "should require matching passwords" do
	  new_attr = @attr
		new_attr[:pass_phrase] = "passphrase"
		new_attr[:pass_phrase_confirmation] = "not_the_same"
		User.new(new_attr).should_not be_valid
	end

	it "should reject short passwords" do
		short_pass = "a" * 5
		new_attr = @attr
		User.new(@attr, :pass_phrase => short_pass).should_not be_valid
	end

	it "should reject very long passwords" do
		short_pass = "a" * 50
		new_attr = @attr
		User.new(@attr, :pass_phrase => short_pass).should_not be_valid
  end

  describe "password encryption" do

    before :each do
      new_attr = @attr
      new_attr[:pass_phrase] = "passphrase"
      new_attr[:pass_phrase_confirmation] = new_attr[:pass_phrase]
      @user = User.create new_attr
    end

    it "should have an encrypted password" do
      @user.should respond_to :encrypted_pass
    end

    it "should store the pass phrase correctly" do
      (@user.pass_phrase == "passphrase").should be_true
    end

    it "should validate passwords" do
      @user.correct_password?("passphrase").should be_true
    end

  end
end
