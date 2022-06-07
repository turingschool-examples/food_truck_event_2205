class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, qty)
    @inventory[item] += qty
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    @inventory.map {|item, qty| item.price * qty}.sum
  end
end
