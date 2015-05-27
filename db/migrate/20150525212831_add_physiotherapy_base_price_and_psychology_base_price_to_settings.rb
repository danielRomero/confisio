class AddPhysiotherapyBasePriceAndPsychologyBasePriceToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :physiotherapy_base_price, :float, default: 38.0
    add_column :settings, :psychology_base_price, :float, default: 38.0
  end
end
