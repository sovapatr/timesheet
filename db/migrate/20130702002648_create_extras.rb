class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.string :code
      t.string :description
      t.integer :job_id

      t.timestamps
    end
  end
end
