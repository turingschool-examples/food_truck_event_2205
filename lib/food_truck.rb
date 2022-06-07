require './lib/item'
class FoodTruck
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = {}
    @inventory.default = 0
  end

  def check_stock(item)
    if inventory.has_key?(item)
      return inventory[item]
    else
      return 0
    end
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    potential_revenue_sum = 0
    inventory.each do |item, quantity|
      potential_revenue_sum += (item.price * quantity.to_f)
    end
    return potential_revenue_sum.to_f
  end

end
