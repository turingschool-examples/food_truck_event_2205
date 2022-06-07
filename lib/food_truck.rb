class FoodTruck
  attr_reader :name, :inventory, :price
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @price = price

  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, number)
     @inventory[item] += number
  end


end
