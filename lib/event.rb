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
        @food_trucks.map {|truck| truck.name}
    end

    def food_trucks_that_sell(item)
        @food_trucks.find_all {|truck| truck.inventory.include?(item)}
    end

    def overstocked_items
        overstocked = total_inventory.select {|_item, values| values[:food_trucks].length > 1   && values[:quantity] > 50}
        overstocked.keys
    end

    def sorted_item_list
        @food_trucks.flat_map {|truck| truck.inventory.map {|item, _qty| item.name}}.uniq.sort
    end

    def item_list
        @food_trucks.flat_map {|truck| truck.inventory.map {|item, _qty| item}}.uniq
    end

    def total_inventory
        return_hash = {}
        item_list.each do |item|
            food_trucks_w_item = food_trucks_that_sell(item)
            qty = food_trucks_w_item.sum{|truck| truck.inventory[item]}
            return_hash[item] = {quantity: qty, food_trucks: food_trucks_w_item}
        end
        return_hash      
    end
end