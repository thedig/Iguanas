# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  token      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Session < ActiveRecord::Base
  attr_accessible :token, :user_id

  validates :user_id, :token, :presence => true
  validates :token, :uniqueness => true

  belongs_to :user

  def self.generate_token
    SecureRandom.urlsafe_base64
  end

  def terminate!
    self.destroy
  end

end
