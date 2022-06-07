class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    trucks = []
    @food_trucks.each do |truck|
      if truck.inventory.include?(item)
        trucks << truck
      end
    end
    trucks
  end

  def overstocked_items
    items = []
    item_total = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, num|
        if item_total.include?(item) == false
          item_total[item] = num
        else
          item_total[item] += num
        end
        if food_trucks_that_sell(item).count >= 2
          items << item
        end
      end
    end
    item_over_50 = []
    item_total.each do |item, sum|
      if sum >= 50
        item_over_50 << item
      end
    end
    over_items = []
    # require 'pry'; binding.pry
    @food_trucks.each do |truck|
      truck.inventory.each do |item, num|
        if items.include?(item) && item_over_50.include?(item)
          over_items << item
        end
      end
    end
    over_items.uniq
  end

  def sorted_item_list
    item_list = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, num|
        item_list << item.name
      end
    end
    item_list.uniq.sort
  end

  def total_inventory
    item_total = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, num|
        if item_total.include?(item) == false
          item_total[item] = {quantity: num}
        else
          item_total[item][:quantity] += num
        end
      end
    end
    # inventory = {}
    item_total.each do |item, info|
      info[:food_trucks] = food_trucks_that_sell(item)
    end
    item_total

  end




end
