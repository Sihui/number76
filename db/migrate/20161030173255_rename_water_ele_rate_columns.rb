class RenameWaterEleRateColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :water_rates, :month, :date
    rename_column :electricity_rates, :month, :date
  end
end
