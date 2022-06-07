require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

  end

  it "exists" do
    expect(@food_truck).to be_a(FoodTruck)
  end

  it "has a name" do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has an inventory that is empty to start with" do
    expect(@food_truck.inventory).to eq({})
  end

  it "can check its stock of an item" do

    expect(@food_truck.check_stock(@item1).count).to eq(0)

  end

  it "can add items to its inventory" do

    @food_truck.stock(@item1, 30)

    expect(@food_truck.check_stock(@item1)).to eq(30)
    expect(@food_truck.inventory).to eq({@item1 => 30})

    @food_truck.stock(@item1, 25)

    expect(@food_truck.check_stock(@item1)).to eq(55)

    @food_truck.stock(@item2, 12)

    expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
    expect(@food_truck.check_stock(@item2)).to eq(12)
  end
end
