class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :permalink, unique: true, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :section_id, null: false
      t.string :primary_image
      t.string :keywords

      t.timestamps null: false

      t.index :section_id
      t.index [:section_id, :permalink], unique: true
      t.index :permalink, unique: true
    end
  end
end
