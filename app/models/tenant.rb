# == Schema Information
#
# Table name: tenants
#
#  id         :integer          not null, primary key
#  name       :string           default("张三"), not null
#  phone      :string
#  gov_id     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tenant < ApplicationRecord
  has_many :room_tenant_connections
  has_many :rooms, through: :room_tenant_connections

  def curr_room_number
    curr_room.number unless !curr_room
  end

  def curr_room
    curr_connection.room unless !curr_connection
  end

  def curr_connection
    room_tenant_connections.find_by(active:true)
  end
end
