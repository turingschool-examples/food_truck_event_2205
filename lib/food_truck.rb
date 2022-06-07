class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock
    @inventory.values.sum
  end

  def stock(key, value)
    if @inventory == {}
      @inventory = {
      key => value
      }
    elsif @inventory.key?(key)
      @inventory[key] += value
    elsif @inventory.empty? == false
      @inventory[key] = value
    end
  end
end
