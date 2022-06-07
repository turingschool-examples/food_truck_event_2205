class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    food_truck_sells = []
    @food_trucks.each do |truck|
      if truck.inventory.include?(item)
        food_truck_sells << truck
      end
    end
    food_truck_sells
  end

  def overstocked_items
    overstocked = []
    total_quantity = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |truck_item, truck_quantity|
        total_quantity[truck_item] = truck_quantity
        #if(statement) sold by more than 1 food truck
        #AND(&&)
        #the total quantity is greater(>) than 50.
      end
    end
  end
end
