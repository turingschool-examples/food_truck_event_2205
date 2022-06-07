require './lib/food_truck'
require './lib/item'
require 'rspec'
require 'pry'

RSpec.describe FoodTruck do
  it "food truck exist" do
    food_truck = FoodTruck.new("Rocky Mountain Pies") price: '$2.50'})
    expect(food_truck).to be_a FoodTruck
  end

end
