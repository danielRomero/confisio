class AddKeywordsAndPageDescriptionToAppConfigurations < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configurations, :description, :text
  end
end
