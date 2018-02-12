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

require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
