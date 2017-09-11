class CreateAdminPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.string :name
      t.float :value, null: false
      t.time :session_duration
      t.boolean :from
      t.boolean :not_other_discounts

      t.references :section, foreign_key: true
      t.timestamps
    end
  end
end
