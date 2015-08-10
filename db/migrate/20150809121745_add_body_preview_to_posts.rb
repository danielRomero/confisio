class AddBodyPreviewToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :body_preview, :text
  end
end
