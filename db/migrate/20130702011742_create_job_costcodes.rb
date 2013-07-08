class CreateJobCostcodes < ActiveRecord::Migration
  def change
    create_table :job_costcodes do |t|
      t.integer :job_id
      t.integer :costcode_id

      t.timestamps
    end
  end
end
