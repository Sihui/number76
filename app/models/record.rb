# == Schema Information
#
# Table name: records
#
#  id                  :integer          not null, primary key
#  date                :datetime         default(Sun, 30 Oct 2016 01:58:08 UTC +00:00), not null
#  pre_water_count     :decimal(, )      default(0.0), not null
#  current_water_count :decimal(, )      default(0.0), not null
#  pre_ele_count       :decimal(, )      default(0.0), not null
#  current_ele_count   :decimal(, )      default(0.0), not null
#  internet_fee        :decimal(, )      default(0.0), not null
#  tv_fee              :decimal(, )      default(0.0), not null
#  cleaning_fee        :decimal(, )      default(0.0), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  room_id             :integer          default(0), not null
#  tenant_id           :integer          default(0), not null
#  electricity_rate_id :integer          default(0), not null
#  water_rate_id       :integer          default(0), not null
#  receipt_id          :integer
#

class Record < ApplicationRecord
  belongs_to :room
  belongs_to :receipt

  def total_fee
    ele_fee + water_fee + cleaning_fee + tv_fee + internet_fee + room.rent
  end

  def ele_fee
    used_ele_count * receipt.electricity_rate.rate
  end

  def water_fee
    used_water_count * receipt.water_rate.rate
  end

  def used_water_count
    current_water_count - pre_water_count
  end

  def used_ele_count
    current_ele_count - pre_ele_count
  end
end
