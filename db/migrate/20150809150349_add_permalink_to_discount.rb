class AddPermalinkToDiscount < ActiveRecord::Migration[4.2]
  def change
    add_column :discounts, :permalink, :string
  end
end
