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
    food_trucks.each do |truck|
      truck.inventory.keys.each do |item|
        if truck.check_stock(item) >= 50
          overstock_list << item
        end
      end
      # require "pry"; binding.pry
      overstock_list
    end
  end

  def sorted_item_list
    list = []
    @food_trucks.each do |truck|
      truck.inventory.map {|item| list << item[0].name}
    end
    return list.uniq
  end
end
