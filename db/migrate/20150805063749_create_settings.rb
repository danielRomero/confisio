class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :section_id, null: false
      t.float :base_price
      t.text :meta_keywords

      t.timestamps null: false

      t.index :section_id
    end
  end
end
