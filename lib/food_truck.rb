require 'helper'

class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory.select {|item_object| item_object == item}.count
  end

  def stock(item, quantity)
    @inventory.include?(item) ? update_stock(item, quantity) : @inventory.store(item, quantity)
  end

  def update_stock(item, quantity)
    new_quantity = @inventory[item] + quantity
    @inventory[item] = new_quantity
  end
end
