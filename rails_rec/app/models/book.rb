class Book < ActiveRecord::Base
  scope :chepter_than, lambda{|p| where 'price < ?', p}
  scope :titled, lambda {|t| where(:title => t)}
  belogs_to :author
  scope :expensive, where('price >= 30')
  
  default_scope where(:published => true)
  
  scope :published, where(:published => true)
  default_scope published.order("title")
  
  validates_presence_of :title
  
  validates :title, :presence => true, :uniqeness => true,
                    :length => 3..100
  
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_length_of :title, :in => 3..100
end
