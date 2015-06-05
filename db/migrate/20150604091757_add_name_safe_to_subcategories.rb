class AddNameSafeToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :name_safe, :string
  end
end
