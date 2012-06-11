class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :pass_phrase, :user_name

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, :presence => true,
										:format => { :with => email_regex },
										:uniqueness => { :case_sensitive => false }
	validates :user_name, :presence => true,
												:length => { :maximum => 50 },
												:uniqueness => { :case_sensitive => false }
end
