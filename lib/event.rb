require './lib/item'
require './lib/food_truck'
class Event
  attr_reader :name, :food_trucks
  attr_accessor

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map {|food_truck|food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all {|food_truck|food_truck.inventory.keys.include?(item)}
  end

  def overstocked_items
    # @food_trucks.each do |food_truck|
  end

  def sorted_item_list
    items = @food_trucks.flat_map {|food_truck|food_truck.inventory.keys}
    item_names = items.map {|item| item.name}
    item_names.uniq.sort
  end


end
