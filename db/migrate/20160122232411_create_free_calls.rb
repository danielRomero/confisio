class CreateFreeCalls < ActiveRecord::Migration[4.2]
  def change
    create_table :free_calls do |t|
      t.string :phone, required: true
      t.string :name, required: true
      t.integer :section_id
      t.column :status, :integer, default: 0

      t.timestamps null: false
    end
  end
end
