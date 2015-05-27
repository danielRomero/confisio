class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
    Category.create(name: "Psicología")
    Category.create(name: "Fisioterapia")
  end
end
