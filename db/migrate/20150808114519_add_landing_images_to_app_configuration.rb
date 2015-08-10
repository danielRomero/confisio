class AddLandingImagesToAppConfiguration < ActiveRecord::Migration
  def change
    add_column :app_configurations, :landing_images, :text, array: true, default: []
  end
end
