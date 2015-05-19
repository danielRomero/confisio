class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :landing_quotes, array: true, default: []
      t.text :landing_images, array: true, default: []
      t.string :phone
      t.string :mobile_phone
      t.string :address_street
      t.integer :address_cp
      t.string :primary_email

      t.timestamps null: false
    end
  end
end
