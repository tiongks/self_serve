class Category < ActiveRecord::Base
  attr_accessible :active, :category_name, :effective_date, :last_effective_date
  validates :category_name, :length => { :maximum => 80 }
  has_many :sub_category
end
