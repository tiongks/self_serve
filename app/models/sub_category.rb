class SubCategory < ActiveRecord::Base
  attr_accessible :active, :categor_id, :effective_date, :last_effective_date, :sub-category_name
  validate :sub-category_name, :length { :maximum => 80 }
  belongs_to :category
end
