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

class Iguana < ActiveRecord::Base
  COLORS = %w(aqua green dark_blue brown purple)

  attr_accessible :age, :birth_date, :name, :color, :sex

  validates :age, :birth_date, :name, :color, :sex, :presence => :true
  validates :color, :inclusion => COLORS
  validates :age, :numericality => :true
  validates :sex, :inclusion => ["M", "F"]

  has_many :iguana_house_cleaning_requests, :dependent => :destroy

end
