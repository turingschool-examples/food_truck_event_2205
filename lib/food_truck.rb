class FoodTruck
  attr_reader :name, :inventory, :stock, :item, :price, :item_name

  def initialize(name)
    @name = name
    @inventory = {}
    @stock = 0
    @item = Item.new({name: name, price: price})
  end

  def check_stock(item)
    @stock
  end

  def stock(item, quantity)
    @inventory[item] = quantity
    @stock += quantity
  end
end
