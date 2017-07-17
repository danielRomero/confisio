class CreateDiscounts < ActiveRecord::Migration[4.2]
  def change
    create_table :discounts do |t|
      t.integer :section_id, null: false
      t.string :title, null: false
      t.text :conditions
      t.text :description
      t.float :value

      t.timestamps null: false
      
      t.index :section_id
    end
  end
end
