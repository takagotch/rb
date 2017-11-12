class CreateRelationship < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
	  t.integer :follower_id
	  t.integer :follower_id
	  
	  t.timestamps
	end
	add_index :relationships, follower_id
	add_index :relationships, follower_id
	add_index :relationships, [:follower_id, :follower_id], unique: true
  end
end