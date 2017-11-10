class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
	  t.text :content, :null => false, :default => ""
	  t.timestamps
	end
  end
end