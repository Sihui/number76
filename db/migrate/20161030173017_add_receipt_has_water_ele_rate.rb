class AddReceiptHasWaterEleRate < ActiveRecord::Migration[5.0]
  def self.up
    add_column :water_rates, :receipt_id, :integer
    add_index 'water_rates', ['receipt_id'], :name => 'water_rate_index_receipt_id'
    add_column :electricity_rates, :receipt_id, :integer
    add_index 'electricity_rates', ['receipt_id'], :name => 'electricity_rate_index_receipt_id'
  end

  def self.down
    remove_column :water_rates, :receipt_id
    remove_column :electricity_rates, :receipt_id
  end
end
