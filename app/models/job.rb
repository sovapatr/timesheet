class Job < ActiveRecord::Base
  has_many :entries
  has_many :entry
  has_many :equipment_entries
  has_many :equipments, through: :equipment_entries
  has_many :job_costcodes, :dependent => :destroy
  has_many :job_extras, :dependent => :destroy
  has_many :employees, through: :entries, select: 'distinct employees.*'
  has_many :costcodes, through: :job_costcodes, select: 'distinct costcodes.*'
  has_many :extras, through: :job_costcodes
  attr_accessible :job_num, :start_date, :job_costcodes_attributes, :job_extras_attributes, :entries_attributes, :entry
  accepts_nested_attributes_for :job_costcodes, :allow_destroy => true
  accepts_nested_attributes_for :job_extras, :allow_destroy => true
  accepts_nested_attributes_for :entries, :allow_destroy => true
  accepts_nested_attributes_for :entry
end
