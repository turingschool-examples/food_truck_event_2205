require './lib/helper'

RSpec.describe Event do
  let!(:food_truck1) {FoodTruck.new("Rocky Mountain Pies")}
  let!(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
  let!(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}
  let!(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let!(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let!(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let!(:item3) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}
  let!(:event) {Event.new("South Pearl Street Farmers Market")}

  it "exists" do
    expect(event).to be_instance_of Event
  end

  it "has a name" do
    expect(event.name).to eq("South Pearl Street Farmers Market")
  end

  it "has food trucks" do
    expect(event.food_trucks).to eq([])

  end
end
