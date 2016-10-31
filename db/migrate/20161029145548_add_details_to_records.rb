class AddDetailsToRecords < ActiveRecord::Migration[5.0]
  def change
    add_reference :records, :room, foreign_key: true
    add_reference :records, :tenant, foreign_key: true
  end
end
