class AddPreMotoEleCountfToRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :pre_moto_ele_count, :decimal, null:false, default: 0
  end
end
