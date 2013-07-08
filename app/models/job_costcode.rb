class JobCostcode < ActiveRecord::Base
  belongs_to :job
  belongs_to :costcode
  belongs_to :extra
  attr_accessible :costcode_id, :job_id, :extra_id
end
