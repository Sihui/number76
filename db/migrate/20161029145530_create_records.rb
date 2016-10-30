class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.datetime :month, null:false, default:DateTime.now
      t.decimal :pre_water_count, null:false, default: 0
      t.decimal :current_water_count, null:false, default: 0
      t.decimal :pre_ele_count, null:false, default: 0
      t.decimal :current_ele_count, null:false, default: 0
      t.decimal :internet_fee, null:false, default: 0
      t.decimal :tv_fee, null:false, default: 0
      t.decimal :cleaning_fee, null:false, default: 0
      
      t.timestamps
    end
  end
end
