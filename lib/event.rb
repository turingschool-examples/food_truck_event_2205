class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    names = @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    trucks = []
    @food_trucks.each do |truck| #could find_all be used for hash value?
      if truck.check_stock(item) > 0
        trucks << truck
      end
    end
    return trucks
  end

  def overstocked_items #stuck, moving forward and will come back
    overstock_list = []
    @food_trucks.each do |truck|
      truck.inventory.each {|item| overstock_list << item[0] if item[1] >= 50}
    end
    items_over_in_mult = []
    overstock_list.each do |item| #could use find_all
      if self.food_trucks_that_sell(item).count > 1
        items_over_in_mult << item
      end
    end
    items_over_in_mult
  end

  def sorted_item_list
    list = []
    @food_trucks.each do |truck|
      truck.inventory.map {|item| list << item[0].name}
    end
    return list.uniq
  end

  def total_inventory
    #creates a hash, items as keys. 3 nested enumerables?
    #values are a hash(quantity written below), food_trucks = self.food_trucks_that_sell(key)
    #uniq does not work on hashes, RIP time.
    total_inventory = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        total_inventory[item] = {}
      end
    end
    require "pry"; binding.pry
  end
end
