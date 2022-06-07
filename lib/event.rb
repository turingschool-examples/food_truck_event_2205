require 'pry'

class Event
  attr_reader :name, :food_trucks, :food_truck_names

  def initialize(name)
    @name = name
    @food_trucks = []
    @food_truck_names = []
  end
  def add_food_truck(food_truck)
    if !@food_trucks.include?(food_truck)
      @food_trucks << food_truck
      @food_truck_names << food_truck.name
    else
      nil
    end
  end
  def food_trucks_that_sell(item)
    @food_trucks.find_all {|truck| truck.check_stock(item) != 0}
  end
  #I could not make a pry catch to see where I went wrong. I cried.
  def overstocked_items
    items = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        sum = food_trucks_that_sell(item).sum(0) {|truck| truck.check_stock(item)}
        array = food_trucks_that_sell(item)
        if array.length > 1 &&  sum > 50
          items << item
        end
      end
    end
    items
  end
end
