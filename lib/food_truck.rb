require './lib/item'
class FoodTruck
  attr_reader :name
  attr_accessor :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory[item] == nil
      return 0
    else
      return @inventory[item]
    end
  end

  def stock(item, quantity)
    @inventory[item]+=quantity
  end

  def potential_revenue
    item_prices = @inventory.keys.map {|item| (item.price)}
  end


end
