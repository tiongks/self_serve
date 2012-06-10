class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.integer :categor_id
      t.string :sub-category_name
      t.integer :active
      t.date :effective_date
      t.date :last_effective_date

      t.timestamps
    end
  end
end
