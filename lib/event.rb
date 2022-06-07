class Event
  def initialize
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |food_truck| food_truck.check_stock(item).positive? }
  end

  def total_inventory
    @total_inventory = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        @total_inventory[item] ||= { food_trucks: [], quantity: 0 }
        @total_inventory[item][:quantity] += quantity
        @total_inventory[item][:food_trucks] << food_truck
      end
    end
    @total_inventory
  end
end
