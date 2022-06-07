class FoodTruck

  attr_reader :name, :inventory, :stock_item, :quantity

  def initialize(truck_name)
    @name = truck_name
    @inventory = []
  end

  def stock(stock_item, stock_quantity)
    @inventory << {:stock_item => stock_item, :quantity => stock_quantity}
  end

  def check_stock(target_item) #checks total quantity
    current_stock = 0
    @inventory.each do |item|
      if item[:stock_item] == target_item
        current_stock += item[:quantity]
      end
    end
    current_stock
  end

  def potential_revenue
    total_potential_rev = 0
    @inventory.each do |item|
      total_potential_rev += item[:stock_item].price * item[:quantity]
    end
    total_potential_rev

#alternative way 1
    # @inventory.sum {|item,amount| item.price * amount}
  end

  # alternative way2
  # def potential_revenue
  #   revenue = 0
  #   @inventory.each do |item, num|
  #     revenue += (item.price * num)
  #   end
  #   revenue
  # end
  #alternativeway3
  # def potential_revenue
  #     @inventory.sum do |item, quantity|
  #       item.price * quantity
  #     end
  #   end
  #alternative way 4
  # def potential_revenue
  #     @inventory.map { |item, amt| item.price * amt }.sum
  #   end

end
