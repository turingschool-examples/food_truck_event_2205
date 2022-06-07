class FoodTruck
  attr_reader :name
  attr_accessor :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item] == nil
      return 0
    else
      return @inventory[item]
    end
  end

  def stock(item, quantity)
    if @inventory.keys.include?(item)
      @inventory[item] + quantity
    else
      @inventory.keys << item
      @inventory[item] = quantity
    end
  end

  def potential_revenue
    item_prices = @inventory.keys.map {|item| (item.price)}
  end


end
