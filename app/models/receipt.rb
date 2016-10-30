# == Schema Information
#
# Table name: receipts
#
#  id         :integer          not null, primary key
#  date       :datetime         default(Sun, 30 Oct 2016 15:37:14 UTC +00:00), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Receipt < ApplicationRecord
  has_many :records
  has_one :water_rate
  has_one :electricity_rate
  after_create :create_records, :create_rates
  accepts_nested_attributes_for :records, :water_rate, :electricity_rate

  def self.get_receipt(getDate)
    receipts = Receipt.select{|r| r.date.year == getDate.year && r.date.month == getDate.month}
    receipts.count > 0 ? receipts.first : Receipt.create!(date:getDate)
  end

  private
    def create_records
      date = Date.today
      Room.all.each do |room|
        record = room.curr_record(date)
        record.update_attributes(receipt_id: self.id) unless record.receipt_id == self.id
      end
    end

    def create_rates
      create_water_rate
      create_ele_rate
    end

    def create_water_rate
      rate = WaterRate.last ? WaterRate.last.rate : 0
      WaterRate.create!(rate:rate, date: date, receipt_id: id)
    end

    def create_ele_rate
      rate = ElectricityRate.last ? ElectricityRate.last.rate : 0
      ElectricityRate.create!(rate:rate, date: date, receipt_id: id)
    end
end
