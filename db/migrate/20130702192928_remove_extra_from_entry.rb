class RemoveExtraFromEntry < ActiveRecord::Migration
  def up
    remove_column :entries, :extra
  end

  def down
    add_column :entries, :extra, :string
  end
end
