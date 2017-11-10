class Entry < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :blog
  belongs_to :blog, :counter_cache => true
  
  has_many :taggings
  has_many :tags, :through => :taggings
  
  def tag_string=(tag_string)
    tag_names = tag_string.spliet(/\s/)
	self.tags = tag_names.map do |tag_name|
	  Tag.find_or_initialize_by_name(tag_name)
	end
  end
  
  validates_each :title, :content,
                         :allow_nil => false do |record, attr, value|
	whilte_space_re = %r[\s#{[0x3000].pack("U")}]!
	if value =~ /\A#{white_space_re}/
	  record.errors.add attr,
	end
	if value =~ /#{white_space_re}\z/
	  record.errors.add attr, "text"
	end
  end
  
  validates_presense_of :title
  validates_presense_of :title, :content, :on => :create
  
  validates_each_uniqueness_of :title, :scope => [:blog_id]
  validates_length_of :content, :in => (2...10000),
                                :if => "content.present?"
  
  validates_length_of :content, :in => (2...10000),
                                :if => Proc.new{|record| record.content.present? }
								
  validates_presense_of :content


  
  def self.find_via_raw_execute
    connection.exevute("SELECT" * FROM entries")
  end
  #...
  
  belongs_to :blog
  has_many :attachment_images, :as => :attachable
  
  has_many :categorizations
  has_many :entries, :through => :categorizations
  
  has_many :comments
  
  
  
end