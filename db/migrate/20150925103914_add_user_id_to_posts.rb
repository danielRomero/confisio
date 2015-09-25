class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :users, :section_id, :integer
  end
end
