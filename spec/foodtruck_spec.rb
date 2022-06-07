require './lib/item'
require './lib/foodtruck'

RSpec.describe FoodTruck do
	describe 'Iteration 1' do
		it 'exists' do
			food_truck = FoodTruck.new("Rocky Mountain Pies")

			expect(food_truck).to be_an_instance_of(FoodTruck)
		end

		it 'returns the foodtrucks name' do
			food_truck = FoodTruck.new("Rocky Mountain Pies")

			expect(food_truck.name).to eq("Rocky Mountain Pies")
		end

		it 'returns an empty hash if food truck doesnt have any items' do
			food_truck = FoodTruck.new("Rocky Mountain Pies")

			expect(food_truck.inventory).to eq({})
		end

		it 'checks the stock of an item that isnt in stock yet' do
			food_truck = FoodTruck.new("Rocky Mountain Pies")
			item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

			expect(food_truck.check_stock(item1)).to eq(0)
		end

		it 'stocks an item' do
			food_truck = FoodTruck.new("Rocky Mountain Pies")
			item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

			food_truck.stock(item1, 30)

			expect(food_truck.check_stock(item1)).to eq(30)
		end

		it 'shows the foodtrucks inventory when stocked with an item' do
			food_truck = FoodTruck.new("Rocky Mountain Pies")
			item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

			food_truck.stock(item1, 30)

			expect(food_truck.inventory).to be_a Hash
			expect(food_truck.inventory.keys.count).to eq(1)
		end

		it 'can add more quantity to an item already stocked' do
			food_truck = FoodTruck.new("Rocky Mountain Pies")
			item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

			food_truck.stock(item1, 30)
			food_truck.stock(item1, 25)

			expect(food_truck.check_stock(item1)).to eq(55)
		end

		it 'can add a different item to the food truck' do
			food_truck = FoodTruck.new("Rocky Mountain Pies")
			item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
			item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

			food_truck.stock(item1, 30)
			food_truck.stock(item1, 25)
			food_truck.stock(item2, 12)

			expect(food_truck.check_stock(item1)).to eq(55)
			expect(food_truck.check_stock(item2)).to eq(12)
			expect(food_truck.inventory.keys.count).to eq(2)
		end


	end
end
