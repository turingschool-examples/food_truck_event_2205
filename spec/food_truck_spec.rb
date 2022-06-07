require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  it 'exists' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck).to be_a(FoodTruck)
  end

  it 'has attributes' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end

  it 'can check item stock' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    expect(food_truck.check_stock(item1)).to eq(0)
  end


end
