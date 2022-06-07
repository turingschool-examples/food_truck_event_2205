require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'instance of item and attributes' do
    expect(@item1).to be_instance_of Item
    expect(@item2).to be_instance_of Item
    expect(@item2.name).to eq('Apple Pie (Slice)')
    expect(@item2.price).to eq(2.50)
  end

  it 'instance of food_truck' do
    expect(@food_truck).to be_instance_of FoodTruck
  end

  it 'food_truck has a name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'inventory is empty by default' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'check_stock default is 0' do
    expect(@food_truck.check_stock(@item1)).to be(0)
  end

  it 'stock an item and add it to inventory' do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory).to eq({@item1 => 30})
  end

  it 'check stock of item' do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.check_stock(@item1)).to eq(30)
  end

  it 'can add more stock' do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    expect(@food_truck.check_stock(@item1)).to eq(55)
  end

  it 'can add more stock' do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item2, 12)
    expect(@food_truck.check_stock(@item1)).to eq(55)
    expect(@food_truck.check_stock(@item2)).to eq(12)
    expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
  end


end
