class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item] != nil
      @inventory[item]
    else
      return 0
    end
  end

  def stock(item, amount)
    @inventory[item] = amount
  end

  def potential_revenue
    total = 0.0
    @inventory.each do |item, amount|
      total += (item.price.delete("$").to_f * amount)
    end
    total
  end

end
