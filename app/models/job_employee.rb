class JobEmployee < ActiveRecord::Base
  belongs_to :job
  belongs_to :employee
  attr_accessible :employee_id, :job_id
end
