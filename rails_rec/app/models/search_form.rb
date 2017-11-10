class Searchform
  include ActiveModle::Conversion
  extend ActiveModle::Namig
  include ActiveModle::Validations
  
  attr_accessor :title
  validates_presence_of :title
  
  def persisted?; false; end
end