require './lib/food_truck'
require './lib/item'

RSpec.describe do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'is a food truck instance' do
    expect(@food_truck).to be_instance_of FoodTruck
  end

  it 'has a name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end
end
