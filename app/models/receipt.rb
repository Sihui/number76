# == Schema Information
#
# Table name: receipts
#
#  id         :integer          not null, primary key
#  date       :datetime         default(Mon, 12 Feb 2018 12:26:51 UTC +00:00), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Receipt < ApplicationRecord
  has_many :records
  has_one :water_rate
  has_one :electricity_rate
  has_one :moto_electricity_rate
  after_create :create_records, :create_rates
  accepts_nested_attributes_for :records, :water_rate, :electricity_rate, :moto_electricity_rate

  def self.get_receipt(getDate)
    receipts = Receipt.select{|r| r.date.year == getDate.year && r.date.month == getDate.month}
    receipts.count > 0 ? receipts.first : Receipt.create!(date:getDate)
  end

  def total_ele
    records.map(&:ele_fee).sum
  end

  def total_water
    records.map(&:water_fee).sum
  end

  def total_moto_ele
    records.map(&:moto_ele_fee).sum
  end

  def total_rent
    records.map(&:rent_fee).sum
  end

  def total
    records.map(&:total_fee).sum
  end

  private
    def create_records
      date = Date.today
      Room.all.each do |room|
        record = room.curr_record(date)
        record.update_attributes!(receipt: self) unless record.receipt == self
      end
    end

    def create_rates
      create_water_rate
      create_ele_rate
      create_moto_ele_rate
    end

    def create_water_rate
      rate = WaterRate.last ? WaterRate.last.rate : 0
      WaterRate.create!(rate:rate, date: date, receipt_id: id)
    end

    def create_ele_rate
      rate = ElectricityRate.last ? ElectricityRate.last.rate : 0
      ElectricityRate.create!(rate:rate, date: date, receipt_id: id)
    end

    def create_moto_ele_rate
      rate = MotoElectricityRate.last ? MotoElectricityRate.last.rate : 0
      MotoElectricityRate.create!(rate:rate, date: date, receipt_id: id)
    end
end
