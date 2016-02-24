class AddValidToToDiscounts < ActiveRecord::Migration
  def up
    add_column :discounts, :valid_to, :datetime
    Discount.update_all(valid_to: 1.year.from_now)
  end

  def down
    remove_column :discounts, :valid_to
  end
end
