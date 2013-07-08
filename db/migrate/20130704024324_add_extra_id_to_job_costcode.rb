class AddExtraIdToJobCostcode < ActiveRecord::Migration
  def change
    add_column :job_costcodes, :extra_id, :integer
  end
end
