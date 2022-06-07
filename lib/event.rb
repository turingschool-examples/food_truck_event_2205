require 'date'

class Event

  attr_reader :name, :food_trucks, :date

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map { |truck| truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all { |truck| truck.inventory.include?(item) }
  end

  def all_items
    items = []
    @food_trucks.each do |truck|
      truck.inventory.each { |item| items << item }
    end
    items
  end

  def overstocked_items
    # blerg!
    by_item = all_items.group_by { |item| item.first.name }
    mult_trucks = by_item.find_all { |name, items| items.count > 1 }.map { |items| items.last }
    overstocked = []
    mult_trucks.first.each do |item|
      count = 0
      count += item.last
      overstocked << item if count > 50
    end
    overstocked.flat_map { |items| items.first }
  end

  def sorted_item_list
    all_items.map { |item| item.first.name }.sort
  end

  def total_inventory
    items_hash = {}
    total_inventory_hash = {}
    all_items.each do |item|
      items_hash[:quantity] = item.last
      items_hash[:food_trucks] = @food_trucks.find_all do |truck|
        truck.inventory.include?(item.first)
      end
      total_inventory_hash[item.first] = items_hash
    end
    total_inventory_hash
  end

  # def sell(item, amt)
  #
  # end

end
