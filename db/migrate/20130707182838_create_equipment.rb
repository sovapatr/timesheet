class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :equip_num
      t.boolean :rental

      t.timestamps
    end
  end
end
