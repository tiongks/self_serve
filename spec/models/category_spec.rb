require 'spec_helper'

describe Category do

	before(:each) do
		@category_name = "category name"
	end

	it "should be able to create a new record" do
		Category.create! :category_name => @category_name 
	end

	it "should not accept very long category names" do
		category_name = "a" * 90
		category = Category.create :category_name => category_name
		category.should_not be_valid
	end

	it "should not accept blank category name" do
		category = Category.create
		category.should_not be_valid
	end

	it "should not accept duplicate category names" do
		category1 = Category.create :category_name => @category_name
		category2 = Category.create :category_name => @category_name.upcase
		category2.should_not be_valid
	end

end
