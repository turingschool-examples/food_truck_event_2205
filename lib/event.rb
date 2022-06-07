class Event

  attr_reader :name, :food_trucks, :food_truck_names

  def initialize(event_name)
    @name = event_name
    @food_trucks = []
    @food_truck_names = []
  end

  def add_food_truck(new_truck)
    @food_trucks << new_truck
    @food_truck_names << new_truck.name
  end

  def food_trucks_that_sell(search_item)
    trucks_with_item = []
    @food_trucks.each do |truck|
      if truck.check_stock(search_item) > 0
        trucks_with_item << truck
      end
    end
    trucks_with_item
  end

end
