class CreateSections < ActiveRecord::Migration[4.2]
  def change
    create_table :sections do |t|
      t.string :name, unique: :true, null: false
      t.string :permalink, unique: :true, null: false

      t.timestamps null: false
      t.index :permalink
    end
  end
end
