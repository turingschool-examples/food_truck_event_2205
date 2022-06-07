class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
    @item_stock = 0
  end

  def check_stock(item)
    @item_stock = 0
    @inventory.each do |key, value|
      @item_stock += value
    end
    @item_stock
  end

  def stock(item, amount)
    @inventory[item]

  end




end
