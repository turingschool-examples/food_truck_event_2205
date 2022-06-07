class FoodTruck

  attr_reader :name ,:inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def stock(item, num)
    if @inventory.include?(item) == false
      @inventory[item] = num
    else
      @inventory[item] += num
    end
  end

  def potential_revenue
    revenue = 0
    @inventory.each do |item, num|
      revenue += (item.price * num)
    end
    revenue
  end

end
