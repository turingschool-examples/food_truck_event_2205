class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.include?(item)
      specific_item = @inventory.find {|item_instance|item_instance[0] == item}
      return specific_item[1]
    else
      0
    end
  end

  def stock(item, quantity)
    if @inventory.include?(item) == false
      @inventory[item] = quantity
    elsif @inventory.include?(item)
      @inventory[item] += quantity
    end
  end

  def potential_revenue
    individul_item_revenue = @inventory.map do |item_instance, quantity|
      item_instance.price * quantity
    end
    individul_item_revenue.sum
  end
end
