class CreateReleaseSuscriptions < ActiveRecord::Migration
  def change
    create_table :release_suscriptions do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
