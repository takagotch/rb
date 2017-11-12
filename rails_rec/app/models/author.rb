class Book < ActiveRecord::Base
  has_many :books
  scope :adult, where("age >= 20")
  scope :lives_in, lambda {|c| where(:country => c)}
end
