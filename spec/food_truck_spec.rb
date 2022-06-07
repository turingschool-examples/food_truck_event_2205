require './lib/food_truck'
require 'rspec'

RSpec.describe FoodTruck do

  before (:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

  it 'returns name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'initializes with empty inventory hash' do
    expect(@food_truck.inventory).to eq({})
  end
end
