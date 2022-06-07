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

  def food_trucks_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.include?(item)
    end
  end

  def overstocked_items
    overstocked = []
    @food_trucks.map do |truck|
      truck.inventory.each do |item, quantity|
        if quantity > 50
          overstocked << item
        end
      end
    end
    overstocked
  end

  def sorted_item_list
    sorted_items = []
    @food_trucks.map do |truck|
      truck.inventory.each do |item, quantity|
        if sorted_items.include?(item)
        sorted_items << item
        end
      end
    end
    sorted_items.sort_by {|item| item.name}
  end


end
