require './lib/food_truck'
require './lib/item'
require 'rspec'
require 'pry'

RSpec.describe FoodTruck do
  it "food truck exist" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck).to be_a FoodTruck
  end

end
