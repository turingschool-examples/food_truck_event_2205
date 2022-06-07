require 'pry'

class FoodTruck
    attr_reader :name, :inventory
    def initialize(name)
        @name = name
        @inventory = Hash.new(0)
    end

    def check_stock(item)
        if !@inventory.include?(item)
            return 0
        else
            @inventory.select do |product,quantity|
                if product == item
                    return quantity
                end
            end
        end
    end

    def stock(item, quantity)
        @inventory[item] += quantity
    end

    def potential_revenue
        revenue = 0
        @inventory.each_entry do |item, quantity|
            revenue += item.price.delete("$").to_f * quantity
        end
        revenue
    end
end