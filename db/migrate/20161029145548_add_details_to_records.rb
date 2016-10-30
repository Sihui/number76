class AddDetailsToRecords < ActiveRecord::Migration[5.0]
  def change
    add_reference :records, :room, foreign_key: true, null: false, default: 0
    add_reference :records, :tenant, foreign_key: true, null: false, default: 0
  end
end
