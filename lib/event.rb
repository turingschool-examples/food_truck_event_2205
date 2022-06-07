class Event
  attr_reader :name, :food_trucks, :food_truck_names

  def initialize(name)
    @name = name
    @food_trucks = []
    @food_truck_names = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
    @food_truck_names << food_truck.name
    @food_trucks
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.inventory.keys.include?(item)
    end
  end

  def overstocked_items
    food_truck_inventories_array
    list_of_all_items_at_event
    inventories_in_single_hash
    duplicate_items_array
    items_greater_than_50_hash
    list_of_all_items_at_event.uniq.select do |item|
      duplicate_items_array.include?(item) && items_greater_than_50_hash.keys.include?(item)
    end
  end

  def sorted_item_list
    food_truck_inventories_array
    item_list = list_of_all_items_at_event.map do |item|
      item.name
    end
    item_list.uniq.sort
  end

  def total_inventory
    food_truck_inventories_array
    inventories_in_single_hash
    total_inventory_hash
  end

  #helper1 to overstocked_items
  #helper1 to sorted_item_list
  #helper1 to total_inventory
  def food_truck_inventories_array
    @inventories = @food_trucks.map do |food_truck|
      food_truck.inventory
    end
  end

  #helper2 to overstocked_items
  #helper2 to sorted_item_list
  def list_of_all_items_at_event
    item_list = @inventories.flat_map do |inventory|
      inventory.map do |item, count|
        item
      end
    end
  end

  #helper3 to overstocked_items
  #heler2 to total_inventory
  def inventories_in_single_hash
    merged_inventory = Hash.new(0)
    @inventories.each do |inventory|
      inventory.each do |item, count|
        merged_inventory[item] += count
      end
    end
    merged_inventory
  end

  #helper4 to overstocked_items
  def duplicate_items_array
    duplicates = list_of_all_items_at_event.select do |item|
      list_of_all_items_at_event.count(item) > 1
    end
    duplicates.uniq
  end

  #helper5 to overstocked_items
  def items_greater_than_50_hash
    quantity_greater_than_50 = inventories_in_single_hash.select do |item, count|
      count > 50
    end
  end

  #heler3 to total_inventory
  def total_inventory_hash
    total_inventory_hash = Hash.new
    inventories_in_single_hash.each do |item, count|
      total_inventory_hash[item] = {
        quantity: count,
        food_trucks: food_trucks_that_sell(item)
      }
    end
    total_inventory_hash
  end
end
