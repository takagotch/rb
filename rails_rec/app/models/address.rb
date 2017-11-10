class Address
  attr_accessor :zip, :prefecture, :city
  
  def initilalize(zip, prefecture, city)
    @zip, @prefecture, @city = zip, prefecture, city
  end
end

Address = Struct.new(:zip, :prefecture, :city)
