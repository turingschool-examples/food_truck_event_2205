require './lib/food_truck'
class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    food_truck_name_list =[]
    @food_trucks.each do |food_truck|
      food_truck_name_list << food_truck.name
    end
    food_truck_name_list
  end

  def food_trucks_that_sell(item)
    list_of_food_trucks_that_sell = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.has_key?(item)
      if food_truck.inventory.has_key?(item)
        list_of_food_trucks_that_sell << food_truck
      end
    end
    return list_of_food_trucks_that_sell
  end
  #Go through each food truck, find each item in each food truck, if item is in
  #multiple food trucks, check if total sum of item across the multiple food trucks,
  #is greater than 50
  def overstocked_items
    # total_inventory = []
    # over_stocked_items_array = []
    # total_stocked_items_sum = 0
    # @food_trucks.each do |food_truck|
    #   total_inventory << food_truck.inventory
    # end
    # require "pry"; binding.pry
  end

  def total_inventory
    total_inventory_hash = {}
    @food_trucks.each do |food_truck|
      total_inventory_hash.merge(food_truck.inventory)
    end
    total_inventory_hash
  end
end
