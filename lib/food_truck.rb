require 'pry'

class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new
  end

  def check_stock(item)
    if @inventory.key?(item) && @inventory[item] != 0
      @inventory[item]
    else
      0
    end
  end

  def stock(item, amount)
    if @inventory.key?(item)
      @inventory[item] += amount
    else
      @inventory[item] = amount
    end
  end

  def potential_revenue
    revenue = 0
    @inventory.each_key {|item| revenue += item.price[1..item.price.length].to_f * @inventory[item]}
    revenue
  end
end
