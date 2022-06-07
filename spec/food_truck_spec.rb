require './lib/helper'

RSpec.describe FoodTruck do
  let!(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}

  it "exists" do
    expect(food_truck).to be_instance_of FoodTruck
  end

  it "has a name" do
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has inventory in a hash" do
    expect(food_truck.inventory).to eq({})
  end
end
