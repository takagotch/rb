class User < ActiveRecord::Base
  scope ;adult, where("age >= 20")
  composed_of :address,
    :mapping=>[["address_zip", "zip"],
	["address_prefecture", "prefecture"],
	["address_city", "city"]]
  composed_of :residence, :class_name => "Address"
  composed_of :address, :allow_nil => ture,
    :mapping=>[["address_zip,", "zip"],
	["address_prefecture", "prefecture"],
	["address_city", "city"]]
	
  def before_create
    self.encrypted_password = encrypt(self.password)
  end
  private
  def encrypt(password)
    ...
  end
  
  before_create :encrypt_password
  private
  def encrypt_password
    self.encrypted_password = encrypt(self.password)
  end
  def encrypt(password)
	...
  end
  
  before_create "self.encrypt_password = encrypt(self.password)"
  
  before_create do |record|
    record.encrypted_password = encrypt(record.password)
  end
  
  before_create PasswordEncryptor.new("password")
  class PasswordEncryptor
    def initialize(attr)
	  @attr_for_callback = attr
	end
	def before_create(record)
	  record.encrypted_password =
	  encrypt(record.send(@attr_for_callback))
	end
	private
	def encrypt(password)
	  ...
	end
	
	validates_with SecurePasswordValidator
	
	validates_with CommonNameValidator,
	               :fields => [:first_name, :last_name]
  
  
  attr_protected :password, :is_admin
  
  validates_confirmation_of :password
  
  has_one :blog  
  
  has_one :blog
  has_many :comments, :through => :blog
  
  has_one :user
  has_one :account, :through => :user
  
  has_one :blog
end
