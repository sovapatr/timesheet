class CreateJobExtras < ActiveRecord::Migration
  def change
    create_table :job_extras do |t|
      t.integer :extra_id
      t.integer :job_id

      t.timestamps
    end
  end
end
