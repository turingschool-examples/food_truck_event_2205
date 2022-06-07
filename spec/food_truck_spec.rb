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

  it 'has attributes' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check the inventory for specified item' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can stock the specified item with x quantity' do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory).to eq({@item1 => 30})
  end

  it 'can stock the inventory after stocking item' do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.check_stock(@item1)).to eq(30)
  end

  it 'can stock additional quantity of an item' do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    expect(@food_truck.check_stock(@item1)).to eq(55)
  end
end
