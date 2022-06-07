require './lib/food_truck'
require './lib/item'

describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it "is an instance of FoodTruck" do
    expect(@food_truck).to be_a(FoodTruck)
  end

  it "has a name" do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has no inventory by default" do
    expect(@food_truck.inventory).to eq({})
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it "can stock items" do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory).to eq({@item1 => 30})
    expect(@food_truck.check_stock(@item1)).to eq(30)
  end

  it "can tell you a truck's potential revenue" do
    @food_truck.stock(@item1, 4)
    @food_truck.stock(@item2, 2)
    expect(@food_truck.potential_revenue).to eq(20.0)
  end


end
