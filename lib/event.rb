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

  #helper1 to overstocked_items
  def food_truck_inventories_array
    @inventories = @food_trucks.map do |food_truck|
      food_truck.inventory
    end
  end

  #helper2 to overstocked_items
  def list_of_all_items_at_event
    item_list = @inventories.flat_map do |inventory|
      inventory.map do |item, count|
        item
      end
    end
  end

  #helper3 to overstocked_items
  def inventories_in_single_hash
    merged_inventory = @inventories.inject(&:merge)
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
end
