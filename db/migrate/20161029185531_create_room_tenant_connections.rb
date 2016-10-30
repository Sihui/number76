class CreateRoomTenantConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :room_tenant_connections do |t|
      t.integer "room_id", null:false, default: 0
      t.integer "tenant_id"
      t.boolean "active", null: false, default: false
      t.boolean "is_admin", null: false, default: false

      t.timestamps
    end
  end
end
