require 'pry'
class FoodTruck

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
    @item_quantity = 0
  end

  def check_stock(item)
    if @inventory.include?(item)
       @inventory[item]
    else
      0
    end
  end

  def stock(item, quantity)
    stocked_item = Item.new({:item => item, :quantity => quantity})
  end

end
