# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  number     :string           default("0"), not null
#  rent       :decimal(, )      default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Room < ApplicationRecord
  has_many :room_tenant_connections
  has_many :records
  has_many :tenants, through: :room_tenant_connections

  def admin_tenant
    curr_connection ? curr_connection.tenant : nil
  end

  def curr_connection
    room_tenant_connections.find_by(active: true, is_admin: true)
  end

  def curr_record(date)
    records = self.records.select{|r| r.date.year == date.year && r.date.month == date.month}
    if records.count > 0
      return records.last
    else
      pre_record = self.records.last
      r = self.records.create!(
        date: date,
        pre_ele_count: pre_record ? pre_record.current_ele_count : 0,
        pre_water_count: pre_record ? pre_record.current_water_count : 0)
      return r
    end
  end
end
