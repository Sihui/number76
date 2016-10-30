# == Schema Information
#
# Table name: room_tenant_connections
#
#  id         :integer          not null, primary key
#  room_id    :integer          default(0), not null
#  tenant_id  :integer
#  active     :boolean          default(FALSE), not null
#  is_admin   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomTenantConnection < ApplicationRecord
  belongs_to :room
  belongs_to :tenant
end
