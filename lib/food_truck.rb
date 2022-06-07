class FoodTruck
  attr_reader :name, :inventory, :item1

  def initialize(truck)
    @name = truck
    @inventory = {}
    item1 = {:item1 => 0}
  end

  def check_stock
    item1.values

  end

  def stock(item, number)
    require "pry"; binding.pry
  end


end
