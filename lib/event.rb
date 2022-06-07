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

  def food_trucks_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def sorted_item_list
    hash_inventory = @food_trucks.map {|food_truck| food_truck.inventory}
    array_of_items = hash_inventory.map do |hash_of_item_instances|
        hash_of_item_instances.flatten.uniq
      end
    end
  end
      # if array_of_inventory.length < array_of_inventory.uniq.length
      # end




  # def overstocked_items #come back to if time
  #   # the_inventory = @food_trucks.map do |food_truck|
  #   #   food_truck.inventory
  #   # end
  #   array_of_inventory = @food_trucks.map {|food_truck| food_truck.inventory}
  #   if array_of_inventory.length < array_of_inventory.uniq.length
  #   end
  # end

  # def total_of_item_at_event(item) #come back to if time
  #   the_inventory = @food_trucks.map do |food_truck|
  #       food_truck.inventory
  #     end
  #   variable = the_inventory.map do |item_instance|
  #         # binding.pry
  #       if item_instance.include?(item)
  #         item_instance
  #       end
  #                 binding.pry
  #     end
  #     return "IDK"
  #   end
