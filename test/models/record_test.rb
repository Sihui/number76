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

require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
