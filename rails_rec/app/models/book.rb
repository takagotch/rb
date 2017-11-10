class Book < ActiveRecord::Base
  validates_presence_of :title
  
  validates :title, :presence => true, :uniqeness => true,
                    :length => 3..100
  
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_length_of :title, :in => 3..100
end
