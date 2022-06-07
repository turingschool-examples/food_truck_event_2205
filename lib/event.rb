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

  def grab_item_objects
    all_items = []
    @food_trucks.map do |truck|
      truck.inventory.each {|item| all_items << item}
    end
    all_items
  end

  def group_unique_items
    new_hash = grab_item_ojects.each_with_object({}) {|element, h| k, v = *element; v; h[k] = v }
    new_hash.map do |item, value|
      item.group_by do |key|
        key.object_id
      end
    end
  end

  def items_in_inventory_with_quantity
    @food_trucks.map do |truck|
      truck.inventory.map {|item_object, quantity| {item_object.name => quantity}}
    end
  end
end
#
# def total_inventory
#
# end
#
# def overstocked_items
#   assess_stocked_items
# end

#   sorted_item_list.map do |item_name|
#     require "pry"; binding.pry
#     item_name == grab_item_objects.each do |item|
#       require "pry"; binding.pry
#       item.name
#     end
#   end
# end
#
# def group_trucks_by_item
#
# end
  # def test_map
  #
  #
  #   @food_trucks.map do |truck|
  #     truck.items_in_inventory_by_name.map do |item, quantity|
  #
  #     end
  #
  #   end
  # end
    # @food_trucks.map do |truck|
    #   truck.items_in_inventory_by_name.map do |item|
    #     [(item.keys.uniq.first.to_sym) item.values.sum]
    #   end
    # end
  # def calculate_item_quantities(items)

  # end
