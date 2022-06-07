class Event
require 'pry'

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select {|truck| truck.inventory.key?(item)}
  end

  def sold_by_more_than_one_truck?(item)
    all_inventory = []
    @food_trucks.each do |truck|
      truck.inventory.each do |inventory_item|
        all_inventory << inventory_item[0].name
      end
    end
    all_inventory.count(item.name) > 1
  end

  # def overstocked_items
  #   items_and_inventory = {}
  #   @food_trucks.each do |truck|
  #     truck.inventory.each do |item|
  #       all_items[item.name]
  #     end
  #   end
  # end

end
