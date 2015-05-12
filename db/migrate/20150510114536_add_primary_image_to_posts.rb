class AddPrimaryImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :primary_image, :string
  end
end
