require './lib/item'
require './lib/food_truck'

class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
    super
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_trucks_that_sell(item)
    answer = []
    @food_trucks.each do |truck|
      if answer.include?(truck)
        next
      elsif truck.inventory == item
        answer << truck
      end
    end
  end


  def food_trucks_names
    #
  end

  def potential_revenue
    total_sum = 0
    @food_trucks.each do |x|
      prices = x.price.keys
      total_sum = prices.sum
    end
  end
end
