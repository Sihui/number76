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

require 'test_helper'

class TenantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
