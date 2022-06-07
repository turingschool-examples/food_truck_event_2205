class Event
  attr_reader :name, :food_truck
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    food_truck << food_truck
  end

  def food_truck_names
    food_truck.all.name
  end


end
