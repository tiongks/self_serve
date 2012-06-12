class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :user_name, :pass_phrase, :pass_phrase_confirmation
	attr_accessor :pass_phrase, :pass_phrase_confirmation

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, :presence => true,
										:format => { :with => email_regex },
										:uniqueness => { :case_sensitive => false }
	validates :user_name, :presence => true,
												:length => { :maximum => 50 },
												:uniqueness => { :case_sensitive => false }
	validates :pass_phrase, :presence => true,
													:confirmation => true,
													:length => { :within => 6..30 }
	validates :pass_phrase_confirmation, :presence => true
end
