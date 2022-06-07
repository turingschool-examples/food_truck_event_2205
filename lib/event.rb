class Event
  require 'time'
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all {|truck| truck.inventory.keys.include?(item)}
  end

  def sorted_item_list
    unsorted = @food_trucks.map do |truck|
      truck.inventory.map do |item|
        item[0]
      end
    end.flatten.uniq
    sorted = unsorted.sort_by do |item|
      item.name
    end
  end

  def overstocked_items
    pop_items = []
    @food_trucks.select do |truck|
      truck.inventory.find_all do |item, quantity|
        if quantity >= 50 && food_trucks_that_sell(item).count > 1
          pop_items << item
        end
      end
    end
    pop_items
  end

  def items_array
    @food_trucks.flat_map {|truck| truck.inventory.keys}.uniq
  end

  def total_inventory
    hash = {}
    items_array.each do |item|
      sum = food_trucks.sum do |truck|
        if truck.inventory.keys.include?(item)
          truck.inventory[item]
        else
          0
        end
      end
      hash[item] = {quantity: sum, food_trucks: food_trucks_that_sell(item)}
    end
    hash
  end

  def date
    today = Date.today
    return today.to_s
  end
end
