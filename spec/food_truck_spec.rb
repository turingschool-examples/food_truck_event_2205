require './lib/food_truck'
require './lib/item'

RSpec.describe do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'is a food truck instance' do
    expect(@food_truck).to be_instance_of FoodTruck
  end

  it 'has a name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'has an inventory' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check stock of a food' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can add food to stock' do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory.keys[0]).to eq(@item1)
    expect(@food_truck.inventory.keys[0].class).to eq(Item)
    expect(@food_truck.inventory.values[0]).to eq(30)
  end
end
