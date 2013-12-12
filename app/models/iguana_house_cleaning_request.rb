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

class IguanaHouseCleaningRequest < ActiveRecord::Base
  STATUSES = %w(PENDING APPROVED DENIED)

  attr_accessible :iguana_id, :start_date, :end_date, :status

  before_validation(on: :create) do
    self.status ||= "PENDING"
  end

  validates :iguana_id, :start_date, :end_date, :status, :presence => :true
  validates :status, :inclusion => STATUSES
  validate :does_not_conflict

  belongs_to :iguana

  def approve!
    self.status = "APPROVED" if self.status == "PENDING"
    ActiveRecord::Base.transaction do
      self.save
      overlapping_pending_requests.each { |req| req.deny!}
    end
  end

  def deny!
    self.status = "DENIED"
    self.save
  end

  private

  def does_not_conflict
    if self.status == "APPROVED"
      unless overlapping_approved_requests.empty?
        errors[:status] << "can't be approved due to conflict"
      end
    end
  end

  def overlapping_approved_requests
    overlapping_requests.where(:status => "APPROVED")
  end

  def overlapping_pending_requests
    overlapping_requests.where(:status => "PENDING")
  end


  def overlapping_requests
    IguanaHouseCleaningRequest
      .where("id != ?", self.id || 0)
      .where(:iguana_id => self.iguana_id)
      .where("start_date <= CAST(? AS DATE)", self.end_date.to_s)
      .where("end_date >= CAST(? AS DATE)", self.start_date.to_s)
  end
end
