class AddPermalinkToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :permalink, :string
  end
end
