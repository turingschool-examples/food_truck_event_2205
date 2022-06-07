require 'helper'

class FoodTruck
  attr_reader :name,
              :inventory,
              :check_stock

  def initialize(foodtruck_name)
    @name = foodtruck_name
    @inventory = {}

  end

  def check_stock(item)
    if @inventory.include?(:item) == false
      0
    else @inventory[:item]
    end
  end

  def stock(item, quantity)
    if @inventory.include?(:item)
      @inventory.merge!(item: quantity + @inventory[:item])
    else @inventory.merge!(item: quantity)
    end
  end

  # def inventory
  #   @inventory
  # end

end
