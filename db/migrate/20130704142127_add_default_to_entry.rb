class AddDefaultToEntry < ActiveRecord::Migration
  def change
    change_column :entries, :entered, :boolean, :default => false
  end
end
