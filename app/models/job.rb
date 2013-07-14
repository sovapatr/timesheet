class Job < ActiveRecord::Base
  has_many :entries
  has_many :entry
  has_many :equipment_entries
  has_many :equipments, through: :equipment_entries
  has_many :job_costcodes, :dependent => :destroy
  has_many :job_extras, :dependent => :destroy
  has_many :job_employees, :dependent => :destroy
  has_many :employees, through: :job_employees
  has_many :costcodes, through: :job_costcodes, select: 'distinct costcodes.*'
  has_many :extras, through: :job_costcodes
  attr_accessible :job_num, :start_date, :job_costcodes_attributes, :job_extras_attributes, :entries_attributes, :job_employees_attributes, :entry
  alias_attribute :name, :job_num
  accepts_nested_attributes_for :job_costcodes, :allow_destroy => true
  accepts_nested_attributes_for :job_extras, :allow_destroy => true
  accepts_nested_attributes_for :entries, :allow_destroy => true, :reject_if => :no_time
  accepts_nested_attributes_for :job_employees, :allow_destroy => true
  
  def no_time(attributes)
    (attributes[:time_r].blank? && attributes[:time_o].blank?)
  end
end
