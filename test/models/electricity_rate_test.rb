# == Schema Information
#
# Table name: electricity_rates
#
#  id         :integer          not null, primary key
#  date       :datetime         default(Sun, 30 Oct 2016 01:58:08 UTC +00:00), not null
#  rate       :decimal(, )      default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  receipt_id :integer
#

require 'test_helper'

class ElectricityRateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
