# == Schema Information
#
# Table name: iguanas
#
#  id         :integer          not null, primary key
#  age        :integer          not null
#  birth_date :date             not null
#  color      :string(255)      not null
#  name       :string(255)      not null
#  sex        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class IguanaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
