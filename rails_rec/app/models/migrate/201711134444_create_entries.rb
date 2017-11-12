class CreateEntries < ActiveRecord::Migration
  #def self.up
  def change
    create_table :entries do |t|
	  t.string :title
	  t.text   :content
	  t.references :blog
	  t.timestamps
	  #t.string :title, :null => false, :limit => 100, :default => "no title"
	add_column :entries, :published_on, :date
	end
  end
  
  def self.down
    drop_table :entries
  end
end

#rake db:migrate
#rake db:migrate RAILS_ENV=production VERSION=201711134444