class AddBodyPreviewToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :body_preview, :text
  end
end
