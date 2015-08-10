class CreateAppConfigurations < ActiveRecord::Migration
  def change
    create_table :app_configurations do |t|
      t.string :telefono_movil
      t.string :telefono_fijo
      t.string :calle
      t.string :numero
      t.string :cp
      t.string :ciudad
      t.string :email

      t.timestamps null: false
    end
  end
end
