class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @stock = 0
  end

  def check_stock(items)
    @inventory[items]
  end


end
