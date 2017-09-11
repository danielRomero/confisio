class CreateAdminPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :section, foreign_key: true
      t.string :title, null: :false
      t.string :permalink, null: :false, unique: true
      t.text :body, null: false
      t.string :banner

      t.index :permalink
      t.timestamps
    end
  end
end
