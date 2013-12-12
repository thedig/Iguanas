# == Schema Information
#
# Table name: iguana_house_cleaning_requests
#
#  id         :integer          not null, primary key
#  iguana_id  :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class IguanaHouseCleaningRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
