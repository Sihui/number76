class RenameRecordMonth < ActiveRecord::Migration[5.0]
  def change
    rename_column :records, :month, :date
  end
end
