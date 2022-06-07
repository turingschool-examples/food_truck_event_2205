require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
    let(:item_1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item_2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
    let(:item_3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
    let(:item_4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}
    let(:item_5) {Item.new({name: "onion pie", price: "$25.00"})}
    let(:food_truck_1) {FoodTruck.new("Rocky Mountain Pies")}
    let(:food_truck_2) {FoodTruck.new("Ba-Nom-a-Nom")}
    let(:food_truck_3) {FoodTruck.new("Palisade Peach Shack")}
    let(:event) {Event.new("South Pearl Street Farmers Market")}
    before(:each) do
        food_truck_1.stock(item_1, 35)
        food_truck_1.stock(item_2, 7)
        food_truck_2.stock(item_3, 25)
        food_truck_2.stock(item_4, 50)
        food_truck_3.stock(item_1, 65)
        food_truck_3.stock(item_3, 10)  
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

    it 'returns food trucks that sell an item' do
        event.add_food_truck(food_truck_1)
        event.add_food_truck(food_truck_2)
        event.add_food_truck(food_truck_3)

        expect(event.food_trucks_that_sell(item_1)).to eq([food_truck_1, food_truck_3])
        expect(event.food_trucks_that_sell(item_4)).to eq([food_truck_2])
    end

    it 'returns overstocked items' do
        event.add_food_truck(food_truck_1)
        event.add_food_truck(food_truck_2)
        event.add_food_truck(food_truck_3)

        expect(event.overstocked_items).to eq([item_1])
    end

    it ' sorts items alphabetically' do
        event.add_food_truck(food_truck_1)
        event.add_food_truck(food_truck_2)
        event.add_food_truck(food_truck_3)
        
        expect(event.sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
    end

    it 'returns a hash of the total inventory' do
        event.add_food_truck(food_truck_1)
        event.add_food_truck(food_truck_2)
        event.add_food_truck(food_truck_3)

        expect(event.total_inventory).to be_a(Hash)
        expect(event.total_inventory.length).to eq(4)
        expect(event.total_inventory[item_1]).to eq({quantity: 100, food_trucks: [food_truck_1, food_truck_3]})
    end

    it 'can sell items' do
        event.add_food_truck(food_truck_1)
        event.add_food_truck(food_truck_2)
        event.add_food_truck(food_truck_3)

        expect(event.sell(item_1, 200)).to be false
        expect(event.sell(item_5, 1)).to be false
        expect(event.sell(item_4, 5)).to be true
        expect(food_truck_2.check_stock(item_4)). to eq(45)
        expect(event.sell(item_1, 40)).to be true
        expect(food_truck_1.check_stock(item_1)). to eq(0)
        expect(food_truck_3.check_stock(item_1)). to eq(60)
    end
end