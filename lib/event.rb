require 'helper'

class Event
  attr_reader :name,
              :food_trucks


  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select {|truck| truck.inventory.include?(item)}
  end

  def sorted_item_list
    list = []
    @food_trucks.map do |truck|
      truck.items_in_inventory_by_name.each {|item| list << item}
    end
    list.uniq.sort
  end

  def overstocked_items
    assess_stocked_items
  end

  def test_map


    @food_trucks.map do |truck|
      truck.items_in_inventory_by_name.map do |item, quantity|

      end

    end
  end
    # @food_trucks.map do |truck|
    #   truck.items_in_inventory_by_name.map do |item|
    #     Hash[(item.keys.uniq.first.to_sym) item.values.sum]
    #   end
    # end
  # def calculate_item_quantities(items)

  # end
end
