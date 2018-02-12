class CreateMotoElectricityRate < ActiveRecord::Migration[5.0]
  def change
    create_table :moto_electricity_rates do |t|
      t.datetime :date, null:false, default:DateTime.now
      t.decimal :rate, null:false, default: 0

      t.timestamps
    end
  end
end
