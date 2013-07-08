class AddExtraIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :extra_id, :integer
  end
end
