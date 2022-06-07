require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: "$2.50"})
  end

  it "exists" do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

  it "returns food_truck name" do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "returns empty hash of inventory" do
    expect(@food_truck.inventory).to eq([])
  end

  it "can check the num of stocked items of given item search" do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it "can stock given items and shows up in inventory" do
    @food_truck.stock(@item1, 30)


    expect(@food_truck.inventory.count).to eq(1)
    expect(@food_truck.check_stock(@item1)).to eq(30)
  end

end
