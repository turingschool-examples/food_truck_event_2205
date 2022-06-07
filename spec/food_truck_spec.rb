require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  before :each do
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it "exist" do
    expect(@food_truck).to be_a FoodTruck
  end

  it "has a name" do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has invatory as a {}" do
    expect(@food_truck.invatory).to eq({})
  end

  it "can check stock" do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it "can add stock" do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.invatory).to eq({@item1 => 30})
  end

  it "is able to add stock" do
    @food_truck.check_stock(@item1)
    @food_truck.stock(@item1, 30)
    expect(@food_truck.check_stock(@item1)).to eq(30)
    @food_truck.stock(@item1, 25)
   expect(@food_truck.check_stock(@item1)).to eq(55)
  end

  it "can add a new instance" do
    @food_truck.check_stock(@item1)
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item2, 12)
     expect(@food_truck.invatory).to eq(@item1 => 55, @item2 => 12)
  end
end
