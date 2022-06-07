class Event
  attr_reader :name, :food_trucks, :food_truck_names

  def initialize(name)
    @name = name
    @food_trucks = []
    @food_truck_names = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
    @food_truck_names << food_truck.name
    @food_trucks
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.inventory.keys.include?(item)
    end
  end
end
