class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, quantity)
    @inventory[item] = quantity
  end

  def check_stock(item)
    @inventory.fetch(item, 0)
  end

  def potential_revenue
    @inventory.sum { |item, quantity| item.price * quantity }
  end
end
