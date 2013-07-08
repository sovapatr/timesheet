class Entry < ActiveRecord::Base
  belongs_to :job
  belongs_to :employee
  belongs_to :costcode
  belongs_to :extra
  attr_accessible :costcode_id, :date, :employee_id, :entered, :extra_id, :job_id, :time_o, :time_r
  scope :unentered, where("entered != ?", true)
  
  before_save :set_extra_id
  
  def set_extra_id
    self.extra_id = JobCostcode.where(job_id: self.job_id).where(costcode_id: self.costcode_id).first.extra_id
  end
  
end
