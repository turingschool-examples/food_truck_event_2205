class Event
  attr_reader :name, :food_trucks, :inventory

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.collect { |truck| truck.name }
  end

    # @food_trucks.map do |food_truck|
    #     food_truck.name
    #   end

    # vendors = []
    # @food_trucks.each do |truck|
    #   vendors << truck.name
    # end
    # return vendors

  def food_trucks_that_sell(item)
    @food_trucks.select { |truck| truck.inventory.include?(item) }
  end

  def total_inventory
    @food_trucks.collect do |truck|
    require "pry"; binding.pry
    end 
  end

end
