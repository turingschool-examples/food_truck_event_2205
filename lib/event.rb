class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_truck(truck)
    food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

#what enumarator could I use here instead of each?
  def food_trucks_that_sell(item)
    trucks = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        if item == item
          trucks << truck
        end
      end
    end
    trucks
  end

#there's probably better enumerables for this.
  def overstocked_items
    stock_hold = []
    overstock = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        if truck.check_stock(item) >= 50 || stock_hold.include?(item) == true
          stock_hold << item
          #it doesn't even get to this pry... 
          require 'pry' ; binding.pry
        end
      end
    end
    stock_hold.each do |item|
      if overstock.include?(item) == false
        overstock << item
      end
    end
    overstock
  end

end
