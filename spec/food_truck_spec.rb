require './lib/item.rb'
require './lib/food_truck.rb'

RSpec.describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it "truck exists and has name" do
    expect(@food_truck).to be_a(FoodTruck)
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has inventory" do
    expect(@food_truck.inventory).to eq({})
  end

  it "can check stock and stock items on truck" do
    expect(@food_truck.check_stock(@item1)).to eq(0)
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory).to eq({@item1 => 30})
    expect(@food_truck.check_stock(@item1)).to eq(30)
    @food_truck.stock(@item1, 25)
    expect(@food_truck.check_stock(@item1)).to eq(55)
    @food_truck.stock(@item2, 12)
    expect(@food_truck.inventory). to eq({@item1 => 55, @item2 => 12})
  end

  







end
