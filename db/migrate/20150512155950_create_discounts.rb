class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :user_id
      t.string :code
      t.string :discount_type
      t.string :title
      t.text :description
      t.float :quantity

      t.timestamps null: false
    end
  end
end
