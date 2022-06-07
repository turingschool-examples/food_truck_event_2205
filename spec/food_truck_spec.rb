require './lib/helper'

RSpec.describe FoodTruck do
  let!(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}
  let!(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let!(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

  it "exists" do
    expect(food_truck).to be_instance_of FoodTruck
  end

  it "has a name" do
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has inventory in a hash" do
    expect(food_truck.inventory).to eq({})
  end

  it "can check stock" do
    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it "can stock items in inventory do
    expect(food_truck.inventory).to eq({})
    food_truck.stock(item1, 25)
    expect(food_truck.inventory).to eq({item1 => 25})
  end
end
