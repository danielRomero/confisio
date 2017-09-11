class CreateAdminCarouselImages < ActiveRecord::Migration[5.1]
  def change
    create_table :carousel_images do |t|
      t.string :image
      t.boolean :hidden, null: false, default: false
      t.timestamps
    end
  end
end
