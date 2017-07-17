class AddUserIdToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :user_id, :integer
    add_column :users, :section_id, :integer
  end
end
