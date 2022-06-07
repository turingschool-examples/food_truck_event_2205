require './lib/food_truck'
require 'rspec'

RSpec.describe FoodTruck do

  before (:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

end
