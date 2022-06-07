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

  def food_truck_names
    @food_trucks.flat_map {|truck| truck.name}
  end

  def food_trucks_that_sell(items)
    @food_trucks.select {|truck| truck.inventory.include?(items)}
  end

  def sorted_item_list
    sorted_list = @food_trucks.flat_map do |truck|
      truck.inventory.flat_map {|k, v| k.name}
    end
    sorted_list.sort.uniq
  end

  def total_inventory
    total_inv = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        if total_inv.keys.include?(item)
          total_inv[item][:quantity] += amount
        else
          total_inv[item] = {quantity: amount, food_trucks: food_trucks_that_sell(item)}
        end
      end
    end
    return total_inv
  end

  def overstocked_items
    total_inv = total_inventory
    total_inv.keys.find_all {|item| total_inv[item][:quantity] > 50 && total_inv[item][:food_trucks].length > 1}
  end
end
