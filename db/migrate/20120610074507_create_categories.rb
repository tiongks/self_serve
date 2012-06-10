class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name
      t.integer :active
      t.date :effective_date
      t.date :last_effective_date

      t.timestamps
    end
  end
end
