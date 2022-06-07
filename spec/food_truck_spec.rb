require './lib/food_truck'
require './lib/item'
require 'rspec'
require 'pry'

RSpec.describe FoodTruck do
  it "food truck exist" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck).to be_a FoodTruck
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end

  it "check item stock " do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck.check_stock(item_1)).to eq(0)
  end

  it "can stock item" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    food_truck.stock(item1, 30)
    expect(food_truck.inventory).to be_a Item
    expect(food_truck.check_stock).to eq(30)
  end

  it "can add to stock" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    food_truck.stock(item1, 30)
    food_truck.stock(item1, 25)
    expect(food_truck.check_stock).to eq(55)
  end

  it "can stock another item" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    food_truck.stock(item1, 30)
    food_truck.stock(item1, 25)
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck.stock(item2, 12)
    expect(food_truck.inventory).to eq({key,value})
    expect(food_truck.check_stock).to eq(12)
  end



end
