class AddCounterCacheToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :entries_count, :integer, :null => false,
	  :default => 0
  end
end