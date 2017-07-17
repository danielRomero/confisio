class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email, unique: true
      t.string :phone
      t.string :gender
      t.string :remember_token
      t.integer :rank
      t.string :password_digest

      t.timestamps null: false

      t.index :email, unique: true
    end
  end
end
