class AddKeywordsAndPageDescriptionToAppConfigurations < ActiveRecord::Migration
  def change
    add_column :app_configurations, :description, :text
  end
end
