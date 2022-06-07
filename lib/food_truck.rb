class FoodTruck

  attr_reader :name, :inventory, :stock_item, :quantity

  def initialize(truck_name)
    @name = truck_name
    @inventory = []
  end

  def stock(stock_item, stock_quantity)
    @inventory << {:stock_item => stock_item, :quantity => stock_quantity}
  end

  def check_stock(target_item)
    current_stock = 0
    @inventory.each do |item|
      if item[:stock_item] == target_item
        current_stock += item[:quantity]
      end
    end
    current_stock
  end

end
