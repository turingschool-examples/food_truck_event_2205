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
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all {|truck| truck.check_stock(item) > 0}
  end

  def all_items
    @food_trucks.flat_map do |truck|
      truck.inventory.map do |item, qty|
        item
      end
    end
  end

  def unique_items
    items.uniq
  end

  def sorted_item_list
    unique_items.name.sort
  end

  def total_inventory
    inventory = {}
    unique_items.each do |item|
      food_trucks_that_sell(item)

  end

  def overstocked_items

    require "pry"; binding.pry

  end
end
