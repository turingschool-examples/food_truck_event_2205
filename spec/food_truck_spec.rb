require './lib/item'
require './lib/food_truck'
require "rspec"

RSpec.describe FoodTruck do
  it "exists" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck).to be_instance_of(FoodTruck)
  end
  it "can return the food truck's name" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end
  it "can return a food truck's initial (empty) inventory" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end
  it "can check a food truck's stock" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    data = ({name: 'Peach Pie (Slice)', price: "$3.75"})
    item1 = Item.new(data)
    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it "can stock a particular item" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    data = ({name: 'Peach Pie (Slice)', price: "$3.75"})
    item1 = Item.new(data)
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    expect(food_truck.check_stock(item1)).to eq(0)
    food_truck.stock(item1, 30)
    expect(food_truck.check_stock(item1)).to eq(30)
    food_truck.stock(item1, 25)
    expect(food_truck.check_stock(item1)).to eq(55)
    food_truck.stock(item2, 12)
    expect(food_truck.check_stock(item2)).to eq(12)
    expect(food_truck.inventory.count).to eq(2)
  end

  it "can return the potential revenue of the entire food truck" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    data = ({name: 'Peach Pie (Slice)', price: "$3.75"})
    item1 = Item.new(data)
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck.stock(item1, 30)
    food_truck.stock(item2, 12)
    expect(food_truck.potential_revenue).to eq(142.5)
  end

end
