class Item
  attr_reader :name

  def initialize(data)
    @name = data[:name]
    @price_string = data[:price]
  end


  def price
    value = @price_string.gsub("$","")
    value.to_f
  end
end
