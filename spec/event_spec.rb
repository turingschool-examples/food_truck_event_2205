require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
    let(:item_1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item_2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
    let(:item_3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
    let(:item_4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}
    let(:food_truck_1) {FoodTruck.new("Rocky Mountain Pies")}
    let(:food_truck_2) {FoodTruck.new("Ba-Nom-a-Nom")}
    let(:food_truck_3) {FoodTruck.new("Palisade Peach Shack")}
    let(:event) {Event.new("South Pearl Street Farmers Market")}
    before(:each) do
        food_truck_1.stock(item_1, 35)
        food_truck_1.stock(item_2, 7)
        food_truck_2.stock(item_3, 35)
        food_truck_2.stock(item_4, 35)
        food_truck_3.stock(item1, 65) 
    end
    it 'exists' do
        expect(event).to be_a(Event)
    end

    it 'has a name' do
        expect(event.name).to eq("South Pearl Street Farmers Market") 
    end

    it 'has a list of food trucks' do
        expect(event.food_trucks).to eq([]) 
        event.add_food_truck(food_truck_1)
        event.add_food_truck(food_truck_2)
        event.add_food_truck(food_truck_3)

        expect(event.food_trucks).to eq([food_truck_1, food_truck_2, food_truck_3]) 
    end

    it 'knows the names of all the food trucks' do
        event.add_food_truck(food_truck_1)
        event.add_food_truck(food_truck_2)
        event.add_food_truck(food_truck_3)

        expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]) 
    end

    it 'returns food trucks that sell and item' do
        event.add_food_truck(food_truck_1)
        event.add_food_truck(food_truck_2)
        event.add_food_truck(food_truck_3)

        expect(event.food_trucks_that_sell(item_1)).to eq([food_truck_1, food_truck_3])
        expect(event.food_trucks_that_sell(item_4)).to eq([food_truck_2])
    end
end