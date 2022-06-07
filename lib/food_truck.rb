class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory[:name].to_i
  end

  def stock(item, quantity)
    @inventory.store(item, quantity)

    end




end
