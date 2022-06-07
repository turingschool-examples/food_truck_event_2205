require 'helper'

RSpec.describe FoodTruck do
  before do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'can create new instance of FoodTruck and return name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'can access new empty hash for foodtruck' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check inventory for a specific item' do
    expect(@food_truck.check_stock(@item1)).to eq (0)
  end

  it 'can stock an item and access item quantity' do
    @food_truck.stock(@item1, 30)

    expect(@food_truck.inventory.count).to eq(1)
    expect(@food_truck.check_stock(@item1)).to eq(30)
  end

  it 'can add stock to and item' do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    expect(@food_truck.check_stock(@item1)).to eq(55)
  end
end





    # food_truck.stock(item2, 12)
    #
    # food_truck.inventory
    # #=> {#<Item:0x007f9c56740d
