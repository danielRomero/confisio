class AddFromToPrices < ActiveRecord::Migration[4.2]
  def change
    add_column :prices, :from, :bool
  end
end
