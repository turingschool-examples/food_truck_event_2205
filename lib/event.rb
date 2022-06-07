class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    names = @food_trucks.map { |truck| truck.name}
  end

  def food_trucks_that_sell(item)
    trucks = []
    @food_trucks.each do |truck|
      truck.inventory.each do |food|
        food[0] == item ? trucks << truck : nil

      end
    end
    trucks
  end

end
