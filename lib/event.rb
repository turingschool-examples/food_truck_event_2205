class Event
    attr_reader :name, :food_trucks
    def initialize(name)
      @name = name
      @food_trucks = []
      @food_truck_names
    end

    def add_food_truck(food_truck)
        @food_trucks << food_truck
    end

    def food_truck_names(food_truck)
        trucks = []
        @food_trucks.each do |food_truck|
          if food_truck.name == name
            trucks << food_truck
          end
    end

  end

end
