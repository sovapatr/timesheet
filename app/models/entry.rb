class Entry < ActiveRecord::Base
  belongs_to :job
  belongs_to :employee
  belongs_to :costcode
  belongs_to :extra
  attr_accessible :costcode_id, :date, :employee_id, :entered, :extra_id, :job_id, :time_o, :time_r, :entry
  scope :unentered, where("entered != ?", true)
  scope :this_week, where('date >= ?', Date.today.beginning_of_week(start_day = :sunday))
  
  validates_numericality_of :time_r, :allow_nil => true
  validates_numericality_of :time_o, :allow_nil => true
  
  before_save :set_extra_id
  
 
  def set_extra_id
    self.extra_id = self.costcode_id ? Job.find(self.job_id).costcodes.find(self.costcode_id).extras : 0
  end
  private
  
  def total_hours
    time_o * time_r
  end

end
