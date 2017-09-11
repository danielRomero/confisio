class CreateAdminDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.string :title, null: false
      t.string :permalink, null: false, unique: true
      t.datetime :valid_to, null: false
      t.float :value
      t.text :description
      t.text :conditions

      t.references :section, foreign_key: true
      t.index :permalink
      t.timestamps
    end
  end
end
