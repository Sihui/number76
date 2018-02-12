# == Schema Information
#
# Table name: water_rates
#
#  id         :integer          not null, primary key
#  date       :datetime         default(Mon, 12 Feb 2018 12:26:51 UTC +00:00), not null
#  rate       :decimal(, )      default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  receipt_id :integer
#

class WaterRate < ApplicationRecord
  belongs_to :receipt
end
