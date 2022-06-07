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
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def overstocked_items
    require "pry"; binding.pry
  end

  def sorted_item_list
    @food_trucks.flat_map do |food_truck|
      # require "pry"; binding.pry
      food_truck.inventory.map do |item, amount|
        item.name
      end
    end.uniq.sort
  end

  def total_inventory
    inventory_hash = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        if inventory_hash[item].nil?
          inventory_hash[item] = {quantity: amount, food_trucks: [food_truck]}
        else
          inventory_hash[item][:quantity] += amount
          inventory_hash[item][:food_trucks] << food_truck
        end
      end
    end
    inventory_hash
  end
end
