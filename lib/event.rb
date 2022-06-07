require 'pry'

class Event
    attr_reader :name, :food_trucks
    def initialize(name)
        @name = name
        @food_trucks =[]
    end

    def add_food_truck(food_truck)
        @food_trucks << food_truck
    end

    def food_truck_names
        @food_trucks.map do |truck|
            truck.name
        end
    end

    def food_trucks_that_sell(item)
        @food_trucks.find_all do |food_truck|
            food_truck.inventory.include?(item)
        end
    end

    def item_sums
        sums = Hash.new(0)
        @food_trucks.each_entry do |truck|
            truck.inventory.each_entry do |item,quantity|
                sums[item] += quantity
            end
        end
        sums
    end

    def overstocked_items
        overstocked = []
        item_sums.filter_map do |product, quantity|
            overstocked << product if quantity > 50 && food_trucks_that_sell(product).length > 1
        end
        overstocked
    end

    def sorted_item_list
        names = []
        @food_trucks.each_entry do |truck|
            truck.inventory.each_entry do |item|
                names << item.first.name
            end
        end
        names.uniq
    end

    def total_inventory
        hash = {}
        item_sums.each_entry do |product, quantity| 
            hash[product] = :quantity
            binding.pry
        end
        # did my best to try and start the hash but it didn't really 
        # work the way I intended. I really wish I couldve linked up with some one 
        #to go over the dbc excercise I got all the way through to the point of creating the
        # nested hash out of the data. None of that really makes sense when it is this deep.
    end

end