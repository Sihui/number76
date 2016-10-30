class AddRecordsHasManyReceipts < ActiveRecord::Migration[5.0]
  def self.up
    add_column :records, :receipt_id, :integer
    add_index 'records', ['receipt_id'], :name => 'index_receipt_id'
  end

  def self.down
    remove_column :records, :receipt_id
  end
end
