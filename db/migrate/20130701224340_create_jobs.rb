class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_num
      t.date :start_date

      t.timestamps
    end
  end
end
