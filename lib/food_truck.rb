class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name

    #maybe??
    # i know this is wrong but i dont know how to fix it
    @inventory = {}
    @stock = 0
  end

  def check_stock(item)
    @stock
  end
end
