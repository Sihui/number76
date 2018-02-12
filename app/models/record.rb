# == Schema Information
#
# Table name: records
#
#  id                     :integer          not null, primary key
#  date                   :datetime         default(Mon, 12 Feb 2018 12:26:51 UTC +00:00), not null
#  pre_water_count        :decimal(, )      default(0.0), not null
#  current_water_count    :decimal(, )      default(0.0), not null
#  pre_ele_count          :decimal(, )      default(0.0), not null
#  current_ele_count      :decimal(, )      default(0.0), not null
#  internet_fee           :decimal(, )      default(0.0), not null
#  tv_fee                 :decimal(, )      default(0.0), not null
#  cleaning_fee           :decimal(, )      default(0.0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  room_id                :integer
#  tenant_id              :integer
#  receipt_id             :integer
#  pre_moto_ele_count     :decimal(, )
#  current_moto_ele_count :decimal(, )
#

class Record < ApplicationRecord
  belongs_to :room
  belongs_to :receipt

  def total_fee
    if with_tenant?
      moto_ele_fee + ele_fee + water_fee + tv_fee + internet_fee + room.rent + 10 # 10 is for cleaning
    else
      0
    end
  end

  def rent_fee
    room.rent
  end

  def ele_fee
    used_ele_count * receipt.electricity_rate.rate
  end

  def moto_ele_fee
    used_moto_ele_count * receipt.moto_electricity_rate.rate
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
  
  def used_moto_ele_count
    current_moto_ele_count - pre_moto_ele_count
  end

  private
  def with_tenant?
    moto_ele_fee + ele_fee + water_fee > 0
  end
end
