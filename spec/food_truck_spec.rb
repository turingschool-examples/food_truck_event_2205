require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do
    expect(@food_truck).to be_a(FoodTruck)
  end

  it 'returns name of the truck' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'returns an empty hash of inventory' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check the stock of inventory' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can add to the stock of inventory' do
    @food_truck.stock(@item1, 30)

    expect(@food_truck.inventory.values).to eq([30])
  end
end
