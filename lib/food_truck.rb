class FoodTruck

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    0
  end

  def stock(food_item, qty)
    inventory[food_item] += qty
    require "pry"; binding.pry
  end
end
