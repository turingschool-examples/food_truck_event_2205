require './lib/item'
require './lib/food_truck'
require 'pry'

RSpec.describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'is a FoodTruck' do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

  it 'has a name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'has an empty inventory by default' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check for quantity of an item' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end
end
