class AddMetroAndBarrioToAppConfiguration < ActiveRecord::Migration
  def change
    add_column :app_configurations, :metro, :string, default: 'Barrio de la concepción'
    add_column :app_configurations, :barrio, :string, default: 'San Pascual, Ciudad Lineal, Arturo Soria'
  end
end
