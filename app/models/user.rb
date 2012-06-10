class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :pass_phrase, :user_name
  #attr_accessor :name, :email

  #def initialize(attributes = {})
  #  @name = attributes[:name]
  #  @name = "#{attributes[:first_name]} #{attributes[:last_name]}"
  #  @email = attributes[:email]
  #end

  def formatted_email
    "#{:first_name} #{:last_name} <#{:email}>"
  end
end
