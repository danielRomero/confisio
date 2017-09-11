class CreateAdminSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :permalink, unique: true, null: false
      t.string :banner

      t.timestamps

      t.index :permalink, unique: true
    end
  end
end
