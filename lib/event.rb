class Event

	attr_reader :name, :food_trucks

	def initialize(name)
		@name = name
		@food_trucks = []
	end

	def add_food_truck(food_truck)
		@food_trucks << food_truck
	end

	def food_truck_names
		@food_trucks.map {|food_truck| food_truck.name}
	end

	def food_trucks_that_sell(item)
		food_trucks_that_sell = []
		@food_trucks.each do |food_truck|
			food_truck.inventory.each do |item_instance, _quantity|
				food_trucks_that_sell << food_truck if item_instance == item
			end
		end
		return food_trucks_that_sell
	end

	def overstocked_items
		more_than_one_truck = []
		overstocked_items = []
		items_by_food_truck.each do |item, food_trucks_with_item|
			more_than_one_truck << item if food_trucks_with_item > 1
		end
		item_totals.each do |item, quantity|
			overstocked_items << item if quantity > 50
		end
		return overstocked_items
	end

	def items_by_food_truck
		items_by_truck = Hash.new(0)
		@food_trucks.each do |food_truck|
			food_truck.inventory.each do |item, _quantity|
			items_by_truck[item] += 1
			end
		end
		return items_by_truck
	end

	def item_totals
		item_totals = Hash.new(0)
		@food_trucks.each do |food_truck|
			food_truck.inventory.each do |item, quantity|
			item_totals[item] += quantity
			end
		end
		return item_totals
	end

	def sorted_item_list
		item_names = []
		item_totals.each do |item, quantity|
			item_names << item.name
		end
		return item_names.sort
	end

	def total_inventory
		total_inventory = {}
		item_totals.each do |item, quantity|
			total_inventory[item] = {quantity: quantity, food_trucks:}
	end

end
