class JobExtra < ActiveRecord::Base
  belongs_to :job
  belongs_to :extra
  attr_accessible :extra_id, :job_id
end
