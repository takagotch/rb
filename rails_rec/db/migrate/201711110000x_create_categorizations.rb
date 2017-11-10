class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
	  t.integer :category_id, :null => false
	  t.integer :entry_id, :null =>false
	  t.timestamps
	end
  end
end