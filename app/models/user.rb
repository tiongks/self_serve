require 'digest'

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

  before_save :encrypt_password

  def correct_password? submitted_password
    # make sure the stored password is encrypted
    return false if submitted_password == :encrypted_pass
    self.encrypted_pass == encrypt(submitted_password)
  end

  private

  def encrypt_password
    @salt = get_salt
    self.encrypted_pass = encrypt(pass_phrase)
  end

  def get_salt
    secure_hash("#{email}--#{first_name}--#{last_name}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest string
  end

  def encrypt(string)
    secure_hash "#{@salt}--#{string}"
  end
end
