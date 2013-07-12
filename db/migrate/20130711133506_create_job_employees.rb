class CreateJobEmployees < ActiveRecord::Migration
  def change
    create_table :job_employees do |t|
      t.integer :job_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
