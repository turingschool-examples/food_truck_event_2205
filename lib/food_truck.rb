class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item_name)
    @inventory[item_name]
  end

  def stock(item_name, count)
    @inventory[item_name] += count
  end

  def potential_revenue
    rev_per_item = @inventory.map do |item, count|
      item.price * count
    end
    rev_per_item.sum 
  end
end
