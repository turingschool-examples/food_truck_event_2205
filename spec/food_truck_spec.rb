require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'is a FoodTruck' do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end
end
