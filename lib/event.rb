class Event

  attr_reader :name, :food_trucks, :food_truck_names

  def initialize(event_name)
    @name = event_name
    @food_trucks = []
    @food_truck_names = []
  end

  def add_food_truck(new_truck) #in instructions says to pass string but interaction pattern sends in instance
    @food_trucks << new_truck
    @food_truck_names << new_truck.name
  end

  def food_trucks_that_sell(search_item)
    trucks_with_item = []
    @food_trucks.each do |truck|
      if truck.check_stock(search_item) > 0
        trucks_with_item << truck
      end
    end
    trucks_with_item
  end
    ##alternative way1
  #   trucks = []
  #   @food_trucks.each do |truck|
  #     if truck.inventory.keys.include? item
  #       trucks << truck
  #     #truck.inventory.keys will give you keys of hash

    ## alternative way2
    # @food_trucks.select {|truck| truck.inventory.include?(item)}
#  end


### iteration 3 from here on out
##alt1
  def item_sums
    sums = Hash.new(0)
    @food_trucks.each do |truck| #replaced each_entry with each
        truck.inventory.each do |item,quantity|
            sums[item] += quantity
        end
    end
    sums
  end

  def overstocked_items
    overstocked = []
    item_sums.filter_map do |product, quantity| #shorthand for filter AND map in one call, with a key value pair for the pair product and quantitity
        overstocked << product if quantity > 50 &&  food_trucks_that_sell(product).length > 1 #
    end
    overstocked
  end
##alt2 -- required total inventory, method havent written yet
  # def overstocked_items
  #   total_inv = total_inventory
  #   total_inv.keys.find_all {|item| total_inv[item][:quantity] > 50 && total_inv[item][:food_trucks].length > 1}
  # end
  ##alt3
  #   def overstocked_items
  #     items = []
  #     item_total = {}
  #     @food_trucks.each do |truck|
  #       truck.inventory.each do |item, num|
  #         if item_total.include?(item) == false
  #           item_total[item] = num
  #         else
  #           item_total[item] += num
  #         end
  #         if food_trucks_that_sell(item).count >= 2
  #           items << item
  #         end
  #       end
  #     end
  #     item_over_50 = []
  #     item_total.each do |item, sum|
  #       if sum >= 50
  #         item_over_50 << item
  #       end
  #     end
  #     over_items = []
  #     # require 'pry'; binding.pry
  #     @food_trucks.each do |truck|
  #       truck.inventory.each do |item, num|
  #         if items.include?(item) && item_over_50.include?(item)
  #           over_items << item
  #         end
  #       end
  #     end
  #     over_items.uniq
  # end
##alt4
  # def overstocked_items
  #   overstocked = total_inventory.select {|_item, values| values[:food_trucks].length > 1   && values[:quantity] > 50}
  #   overstocked.keys
  # end
  ##alt5
  # def overstocked_items
  #   pop_items = []
  #   @food_trucks.each do |truck|
  #     truck.inventory.each do |item, quantity|
  #       if quantity >= 50 && food_trucks_that_sell(item).count > 1
  #         pop_items << item
  #       end
  #     end
  #   end
  #   pop_items
  # end

#sorted_item_list alternatives
#alt1
  def sorted_item_list
    items = @food_trucks.flat_map {|food_truck|food_truck.inventory.keys} #flattens AND maps into one array
    item_names = items.map {|item| item.name}
    item_names.uniq.sort #unique to remove duplicates, and then sorts alphabetically
  end

  #alt2
  # def sorted_item_list
  #   names = []
  #   @food_trucks.each_entry do |truck|
  #       truck.inventory.each_entry do |item|
  #           names << item.first.name
  #       end
  #   end
  #   names.uniq.sort
  # end
#alt3
  # def sorted_item_list
  #   item_list = []
  #   @food_trucks.each do |truck|
  #     truck.inventory.each do |item, num|
  #       item_list << item.name
  #     end
  #   end
  #   item_list.uniq.sort
  # end
#alt4
  # def overstocked_items
  #   total_inventory.select do |item, info| #returns hash
  #     info[:quantity] > 50 && info[:food_trucks].count > 1
  # end.keys #will return only keys that pass,

#total inventory options
#alt1
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
    item_total.each do |item, info|
      info[:food_trucks] = food_trucks_that_sell(item)
    end
    item_total
  end
  #alt2
#   def item_list #gets unique list of all items that food trucks sales so when making hash those are key values
#         @food_trucks.flat_map {|truck| truck.inventory.map {|item, _qty| item}}.uniq
#     end
#
#     def total_inventory
#         return_hash = {}
#         item_list.each do |item| #uses helper method list to then use do to find items, build hash and return it
#             food_trucks_w_item = food_trucks_that_sell(item)
#             qty = food_trucks_w_item.sum{|truck| truck.inventory[item]}
#             return_hash[item] = {quantity: qty, food_trucks: food_trucks_w_item}
#         end
#         return_hash
#     end
#alt3 -- professors way of doing it
def total_inventory
  inv = {}
  @food_trucks.each do |truck|
    truck.inventory.each do |item, quantity|
      #check if they key already exists, if no add it

      if inv[item].nil?
        inv[item] = {quantity: 0, food_trucks: []}
      end

      inv[item][:quantitity] += quantity
      inv[item][:food_trucks] << truck
    end
  end
  inv
end

### START OF ITERATION 4

#def sell
#alt1
#   def sell(item,amount)
#     if total_inventory_by_item(item) < amount
#       return false
#     end
# #same as #food_trucks_that_sell
#     trucks_with_stock = @food_trucks.select {|truck| truck.inventory.include?(item)}
#
#     remaining_amount = amount
#     trucks_with_stock.each do |truck|
#       if truck.check_stock(item) - remaining_amount < 0
#         remaining_amount = (truck.check_stock(item) - remaining_amount).abs
#         truck.inventory[item] = 0
#       else
#         truck.inventory[item] = (truck.inventory[item] - remaining_amount)
#       end
#     end
#
#     return true
#   end
##alt2
  def sell(item, qty)
    if !total_inventory.include?(item) || total_inventory.dig(item, :quantity) < qty ## THIS METHOD USES DIG, searches and yanks value from hash
        return false
    else
        food_trucks_that_sell(item).each do |truck|
            if truck.inventory[item] < qty
                qty -= truck.inventory[item]
                truck.inventory[item] = 0
            else
                truck.inventory[item] -= qty
            end
        end
        return true
    end
  end


end
