require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  it 'exists and has name' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a(FoodTruck)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'has empty inventory and can check stock' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.inventory).to eq({})
    expect(food_truck.check_stock).to eq(0)
  end

  it 'can add stock' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck.stock(item1, 30)

    expect(food_truck.check_stock).to eq(30)
    expect(food_truck.inventory.keys).to eq([item1])
    expect(food_truck.inventory.values).to eq([30])
    food_truck.stock(item1, 25)
    expect(food_truck.check_stock).to eq(55)
    food_truck.stock(item2, 12)
    expect(food_truck.inventory.length).to eq(2)
  end
end
