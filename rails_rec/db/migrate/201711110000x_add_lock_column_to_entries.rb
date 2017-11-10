class AddLockColumnToEntries < ActiveRecord::Migration
  def chnge
    add_column :entries, :lock_version, :integer, :null => false,
	                     :default => 0
  end
end
