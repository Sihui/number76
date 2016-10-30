class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :number, null: false, default: 0
      t.decimal :rent, null: false, default: 0

      t.timestamps
    end
  end
end
