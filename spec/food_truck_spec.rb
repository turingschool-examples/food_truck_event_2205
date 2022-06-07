require './lib/food_truck'
require './lib/item'
require 'rspec'

RSpec.describe FoodTruck do

  before (:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

  it 'returns name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'initializes with empty inventory hash' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'returns 0 when item not in stock' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can add items to stock' do
    @food_truck.stock(@item1,30)

    expect(@food_truck.inventory).to eq({@item1 => 30})
  end
end
