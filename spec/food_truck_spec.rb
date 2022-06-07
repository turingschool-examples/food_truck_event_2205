require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
    expect(@food_truck).to be_an(FoodTruck)
  end

  it 'has a name' do
    expect(@food_truck.name).to eql("Rocky Mountain Pies")
  end

  it 'has no inventory by default' do
    expect(@food_truck.inventory).to eql({})
  end

  it 'checks the stock of an item' do
    expect(@food_truck.check_stock(@item1)).to eql(0)
  end

  it 'adds a new item to the inventory' do
    @food_truck.add_new_item_to_inventory(@item1)
    expect(@food_truck.inventory[@item1]).to eql(0)
  end


  it 'stocks an item' do
    @food_truck.add_new_item_to_inventory(@item1)
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory[@item1]).to eql(30)
  end

  it 'stocks another item' do
    @food_truck.add_new_item_to_inventory(@item1)
    @food_truck.stock(@item1, 30)
    require "pry"; binding.pry
    @food_truck.stock(@item1, 25)
    expect(@food_truck.inventory[@item1]).to eql(55)
  end

end
