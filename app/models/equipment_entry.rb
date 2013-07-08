class EquipmentEntry < ActiveRecord::Base
  belongs_to :job
  belongs_to :equipment
  belongs_to :costcode
  attr_accessible :costcode_id, :date, :entered, :equipment_id, :job_id, :time
end
