class AddReceiptHasMotoEle < ActiveRecord::Migration[5.0]
  def change
    add_column :moto_electricity_rates, :receipt_id, :integer
  end
end
