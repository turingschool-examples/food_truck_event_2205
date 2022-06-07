require './lib/item'
require './lib/foodtruck'
require './lib/event'

RSpec.describe Event do
	describe 'Iteration 2' do
		it 'exists' do
			event = Event.new("South Pearl Street Farmers Market")

			expect(event).to be_an_instance_of(Event)
		end

		it 'returns the event name' do
			event = Event.new("South Pearl Street Farmers Market")

			expect(event.name).to eq("South Pearl Street Farmers Market")
		end

		it 'returns an empty array if there arent any food trucks at the event' do
			event = Event.new("South Pearl Street Farmers Market")

			expect(event.food_trucks).to eq([])
		end

		it 'can add food trucks to the event' do
			event = Event.new("South Pearl Street Farmers Market")
			food_truck1 = FoodTruck.new("Rocky Mountain Pies")

			event.add_food_truck(food_truck1)

			expect(event.food_trucks.count).to eq(1)
			expect(event.food_trucks[0]).to be_a(FoodTruck)
		end

		it 'returns an array with all the instances of food trucks' do
			event = Event.new("South Pearl Street Farmers Market")
			food_truck1 = FoodTruck.new("Rocky Mountain Pies")
			food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
			food_truck3 = FoodTruck.new("Palisade Peach Shack")

			event.add_food_truck(food_truck1)
			event.add_food_truck(food_truck2)
			event.add_food_truck(food_truck3)

			expect(event.food_trucks.count).to eq(3)
		end

		it 'returns an array with all of the food trucks names' do
			event = Event.new("South Pearl Street Farmers Market")
			food_truck1 = FoodTruck.new("Rocky Mountain Pies")
			food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
			food_truck3 = FoodTruck.new("Palisade Peach Shack")

			event.add_food_truck(food_truck1)
			event.add_food_truck(food_truck2)
			event.add_food_truck(food_truck3)

			expect(event.food_truck_names[0]).to eq("Rocky Mountain Pies")
			expect(event.food_truck_names[1]).to eq("Ba-Nom-a-Nom")
			expect(event.food_truck_names[2]).to eq("Palisade Peach Shack")
		end

		it 'returns all food trucks that sell a specified item' do
			event = Event.new("South Pearl Street Farmers Market")
			food_truck1 = FoodTruck.new("Rocky Mountain Pies")
			food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
			food_truck3 = FoodTruck.new("Palisade Peach Shack")
			item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
			item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
			item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
			item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

			food_truck1.stock(item1, 35)
			food_truck1.stock(item2, 7)
			food_truck2.stock(item4, 50)
			food_truck2.stock(item3, 25)
			food_truck3.stock(item1, 65)

			event.add_food_truck(food_truck1)
			event.add_food_truck(food_truck2)
			event.add_food_truck(food_truck3)

			expect(event.food_trucks_that_sell(item1).count).to eq(2)
			expect(event.food_trucks_that_sell(item4).count).to eq(1)
		end

		it 'shows a food trucks potential revenue' do
			event = Event.new("South Pearl Street Farmers Market")
			food_truck1 = FoodTruck.new("Rocky Mountain Pies")
			food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
			food_truck3 = FoodTruck.new("Palisade Peach Shack")
			item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
			item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
			item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
			item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

			food_truck1.stock(item1, 35)
			food_truck1.stock(item2, 7)
			food_truck2.stock(item4, 50)
			food_truck2.stock(item3, 25)
			food_truck3.stock(item1, 65)

			event.add_food_truck(food_truck1)
			event.add_food_truck(food_truck2)
			event.add_food_truck(food_truck3)

			expect(food_truck1.potential_revenue).to eq(148.75)
			expect(food_truck2.potential_revenue).to eq(345.00)
			expect(food_truck3.potential_revenue).to eq(243.75)
		end

	end
	describe 'Iteration 3' do
		it 'can return a list of overstocked items' do
			event = Event.new("South Pearl Street Farmers Market")
			item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
			item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
			item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
			item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
			food_truck1 = FoodTruck.new("Rocky Mountain Pies")
			food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
			food_truck3 = FoodTruck.new("Palisade Peach Shack")

			food_truck1.stock(item1, 35)
			food_truck1.stock(item2, 7)
			food_truck2.stock(item4, 50)
			food_truck2.stock(item3, 25)
			food_truck3.stock(item1, 65)
			food_truck3.stock(item3, 10)

			event.add_food_truck(food_truck1)
			event.add_food_truck(food_truck2)
			event.add_food_truck(food_truck3)

			expect(event.overstocked_items.count).to eq(1)
			expect(event.overstocked_items).to eq([item1])

		end

		it 'can return a sorted list of item names for an event' do
			event = Event.new("South Pearl Street Farmers Market")
			item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
			item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
			item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
			item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
			food_truck1 = FoodTruck.new("Rocky Mountain Pies")
			food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
			food_truck3 = FoodTruck.new("Palisade Peach Shack")

			food_truck1.stock(item1, 35)
			food_truck1.stock(item2, 7)
			food_truck2.stock(item4, 50)
			food_truck2.stock(item3, 25)
			food_truck3.stock(item1, 65)
			food_truck3.stock(item3, 10)

			event.add_food_truck(food_truck1)
			event.add_food_truck(food_truck2)
			event.add_food_truck(food_truck3)
			event.sorted_item_list
			expect(event.sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])

		end

		it 'can return a hash of total inventory from an Event' do
			event = Event.new("South Pearl Street Farmers Market")
			item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
			item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
			item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
			item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
			food_truck1 = FoodTruck.new("Rocky Mountain Pies")
			food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
			food_truck3 = FoodTruck.new("Palisade Peach Shack")

			food_truck1.stock(item1, 35)
			food_truck1.stock(item2, 7)
			food_truck2.stock(item4, 50)
			food_truck2.stock(item3, 25)
			food_truck3.stock(item1, 65)
			food_truck3.stock(item3, 10)

			event.add_food_truck(food_truck1)
			event.add_food_truck(food_truck2)
			event.add_food_truck(food_truck3)

			expect(event.total_inventory).to be_a(Hash)
		end
	end
end
