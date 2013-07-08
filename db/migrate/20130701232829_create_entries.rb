class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :job_id
      t.integer :employee_id
      t.integer :costcode_id
      t.integer :extra
      t.date :date
      t.float :time_r
      t.float :time_o
      t.boolean :entered

      t.timestamps
    end
  end
end
