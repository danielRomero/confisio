class AddFromToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :from, :bool
  end
end
