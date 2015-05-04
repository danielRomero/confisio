class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.string :gender
      t.string :remember_token
      t.integer :rank, default: 0
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
