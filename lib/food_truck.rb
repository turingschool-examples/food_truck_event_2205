class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    amount = @inventory.find { |item_name, amount| @inventory[item] }
    amount == nil ? 0 : amount
  end

def stock(food, amount)
  @inventory[food] = amount
end


end
