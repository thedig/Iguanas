# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :user_name, :password

  validates :user_name, :password_digest, :presence => true
  validates :user_name, :uniqueness => true
  validates :password, :presence => true, :length => {:minimum => 6}, :on => :create

  has_many :iguanas
  has_many :sessions

  def self.find_by_credentials(user_params)
    user = User.find_by_user_name(user_params[:user_name])
    return user if user && user.is_password?(user_params[:password])
    nil
  end

  def is_password?(pt)
    BCrypt::Password.new(password_digest).is_password?(pt)
  end

  def password=(pt)
    @password = pt
    self.password_digest = BCrypt::Password.create(pt)
  end



  private

  attr_reader :password


end
