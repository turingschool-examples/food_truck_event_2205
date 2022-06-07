require './lib/helper'

RSpec.describe FoodTruck do
  let!(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}

  it "exists" do
    expect(food_truck).to be_instance_of FoodTruck
  end
end
