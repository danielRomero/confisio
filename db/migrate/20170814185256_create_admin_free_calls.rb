class CreateAdminFreeCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :free_calls do |t|
      t.references :section, foreign_key: true
      t.string :name
      t.string :phone, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
