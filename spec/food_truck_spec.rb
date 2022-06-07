require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'is a FoodTruck' do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

  it 'has a name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'has an empty inventory by default' do
    expect(@food_truck.inventory).to eq({})
  end
end
