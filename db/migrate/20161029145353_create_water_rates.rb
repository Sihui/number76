class CreateWaterRates < ActiveRecord::Migration[5.0]
  def change
    create_table :water_rates do |t|
      t.datetime :date, null:false, default:DateTime.now
      t.decimal :rate, null:false, default: 0

      t.timestamps
    end
  end
end
