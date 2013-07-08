class CreateCostcodes < ActiveRecord::Migration
  def change
    create_table :costcodes do |t|
      t.string :code
      t.string :description
      t.integer :job_id

      t.timestamps
    end
  end
end
