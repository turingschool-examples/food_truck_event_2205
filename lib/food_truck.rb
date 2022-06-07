class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item1)
    @inventory[item1]
  end
  #took forever to google this. I apologize for using too much time.
  def stock(items, total)
    @inventory[items] += total
  end
end
