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
    names = @food_trucks.map { |truck| truck.name}
  end

  def food_trucks_that_sell(item)
    trucks = []
    @food_trucks.each { |truck| truck.inventory.each {|food| food[0] == item ? trucks << truck : nil }}
    trucks
  end

  def overstocked_items
    items = []
    @food_trucks.each {|food_truck| food_truck.inventory.each {|item, amount| items << item }}
    multiples = items.find {|item| items.count(item) > 1}
    answer = []
    @food_trucks.each do |food_truck|
      total = 0
      total += food_truck.check_stock(multiples)

      total > 50 ? answer << multiples : nil
    end
    answer
  end

end
