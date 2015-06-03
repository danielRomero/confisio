class CreatePostsSubcategories < ActiveRecord::Migration
  def change
    create_table :posts_subcategories, :id => false do |t|
      t.references :post, :subcategory
    end
    add_index :posts_subcategories, [:post_id, :subcategory_id]
  end
end
