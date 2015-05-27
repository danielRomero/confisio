class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.text :description
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
