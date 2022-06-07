require 'pry'
require 'RSpec'
require './lib/item'
require './lib/food_truck'

describe FoodTruck do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end
  it "exists and has a name" do
    expect(@food_truck).to be_a FoodTruck
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end
  it "starts with an empty inventory hash" do
    expect(@food_truck.inventory).to be_a Hash
    expect(@food_truck.inventory).to eq({})
  end
  it "can check_stock, returning zero if none" do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end
  it "can stock and item, and add to item stock" do
    @food_truck.stock(@item1, 30)

    expect(@food_truck.inventory.keys[0]).to be_a Item
    expect(@food_truck.check_stock(@item1)).to eq(30)

    @food_truck.stock(@item1, 25)

    expect(@food_truck.check_stock(@item1)).to eq(55)
  end
  it "can stock multiple items" do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item2, 12)
    expect(@food_truck.check_stock(@item2)).to eq(12)
    expect(@food_truck.inventory.length).to eq(2)
  end
  it "can calculate a food truck's potential revenue (stock * price)" do
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @food_truck3.stock(@item1, 65)
    expect(@food_truck1.potential_revenue).to eq(148.75)
    expect(@food_truck2.potential_revenue).to eq(345.00)
    expect(@food_truck3.potential_revenue).to eq(243.75)
  end
end
