require_relative 'item'
require_relative 'food_truck'

class Event
  attr_accessor :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    all_food_truck_names = []
    @food_trucks.each {|food_truck| all_food_truck_names << food_truck.name}
    all_food_truck_names
  end

  def food_trucks_that_sell(item)
    trucks = []
    @food_trucks.each {|food_truck| trucks << food_truck if food_truck.inventory[item]}
    trucks
  end

  #Unfinished Methods below

  # def overstocked_items
  #   all_items = []
  #   @food_trucks.each{|truck| all_items << truck.inventory}
  # end
  #
  #
  # def sorted_item_list
  #   item = []
  #   @food_trucks.each do |truck|
  #     truck.each do |inventory|
  #       inventory.each do |item|
  #         arr << item
  #       end
  #     end
  #   end
  # end

end
