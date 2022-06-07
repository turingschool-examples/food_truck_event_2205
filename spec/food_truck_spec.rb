require './lib/item'
require './food_truck'

RSpec.describe FoodTruck do

  it 'exists' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a FoodTruck
  end

  it 'has a name' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'can hold inventory' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.inventory).to eq({})
  end

  it 'can check the stock and refill the stock' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.check_stock).to eq([0])
    food_truck.stock(item1, 30)
    expect(food_truck.check_stock).to eq(30)

  end

  xit 'can stock items' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    food_truck.stock(item1, 30)
    expect(food_truck.check)
  end






end
