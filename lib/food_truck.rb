require_relative 'item'

class FoodTruck
  attr_accessor :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory[item] == nil ? add_new_item_to_inventory(item) : @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] != nil ? @inventory[item] += quantity : add_new_item_to_inventory(item) && stock(item,quantity)
  end

  def add_new_item_to_inventory(item)
    @inventory[item] = 0
  end

  def potential_revenue
    calculate_potential_revenue(@inventory)
  end

  def calculate_potential_revenue(inventory)
    rev = []
    @inventory.each {|item, quantity| rev << (item.price * quantity)}
    rev.sum
  end

end
