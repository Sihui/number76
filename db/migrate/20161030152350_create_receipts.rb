class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.datetime :date, null:false, default:DateTime.now

      t.timestamps
    end
  end
end
