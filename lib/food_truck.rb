class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new {|hash, key| hash[key] = 0}
  end

  def check_stock(item)
    amount = @inventory.find { |item_name, amount| item_name = item }
    amount == nil ? 0 : amount[1]
  end

  def stock(food, amount)
    @inventory[food] += amount
  end

  def potential_revenue
    potential_rev = 0
    @inventory.each { |item, amount| potential_rev += (item.price * amount) }
    potential_rev
  end

end
