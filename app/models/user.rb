class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :pass_phrase, :user_name

	validates :email, :presence => true
	validates :user_name, :presence => true
end
