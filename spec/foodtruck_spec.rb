require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
    let(:item_1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item_2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
    let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}

    it 'exists' do
        expect(food_truck).to be_a(FoodTruck)
    end

    it 'has a name' do
        expect(food_truck.name).to eq("Rocky Mountain Pies") 
    end

    it 'has an inventory' do
        expect(food_truck.inventory).to eq({}) 
    end

    it 'keeps stock' do
        expect(food_truck.check_stock(item_1)).to eq(0)
    end

    it 'stocks items' do
        food_truck.stock(item_1, 30)
        expect(food_truck.check_stock(item_1)).to eq(30)
        food_truck.stock(item_1, 25)
        expect(food_truck.check_stock(item_1)).to eq(55)
    end

    it 'updates an inventory' do
        food_truck.stock(item_1, 30)
        food_truck.stock(item_2, 10)
        expect(food_truck.inventory).to eq( { item_1 => 30, item_2 => 10 } )
    end

    it 'returns potential revenue' do
        food_truck.stock(item_1, 30)
        food_truck.stock(item_2, 10)
        expect(food_truck.potential_revenue).to eq(0) 
    end

end