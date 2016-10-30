class CreateTenants < ActiveRecord::Migration[5.0]
  def change
    create_table :tenants do |t|
      t.string :name, null: false, default: '张三'
      t.string :phone
      t.string :gov_id

      t.timestamps
    end
  end
end
