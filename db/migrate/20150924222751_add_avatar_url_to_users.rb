class AddAvatarUrlToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :avatar_url, :string
    add_column :users, :contact_email, :string
    add_column :users, :contact_phone, :string
    add_column :users, :degree, :string
    add_column :users, :specialty, :string
    add_column :users, :google_plus_url, :string
  end
end
