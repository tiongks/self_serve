class AddCategoryUniquenessIndex < ActiveRecord::Migration
  def up
		add_index :categories, :category_name, :unique => true
  end

  def down
		remove_index :categories, :category_name
  end
end
