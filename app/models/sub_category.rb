class SubCategory < ActiveRecord::Base
  attr_accessible :active, :categor_id, :effective_date, :last_effective_date, :sub_category_name
  validate :sub_category_name, :length => { :maximum => 80 }
  belongs_to :category
end
