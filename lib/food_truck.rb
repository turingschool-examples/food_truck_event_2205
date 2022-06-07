require 'helper'

class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory.select {|item_object| item_object == item}
  end

end
