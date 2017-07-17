class CreateCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :permalink, null: false
      t.integer :section_id, null: false

      t.timestamps null: false
    end
  end
end
