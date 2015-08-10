class AddPermalinkToDiscount < ActiveRecord::Migration
  def change
    add_column :discounts, :permalink, :string
  end
end
