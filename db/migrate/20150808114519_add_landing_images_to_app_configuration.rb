class AddLandingImagesToAppConfiguration < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configurations, :landing_images, :text, array: true, default: []
  end
end
