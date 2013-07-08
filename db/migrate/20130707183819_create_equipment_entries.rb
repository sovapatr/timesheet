class CreateEquipmentEntries < ActiveRecord::Migration
  def change
    create_table :equipment_entries do |t|
      t.integer :equipment_id
      t.integer :costcode_id
      t.integer :job_id
      t.date :date
      t.float :time
      t.boolean :entered

      t.timestamps
    end
  end
end
