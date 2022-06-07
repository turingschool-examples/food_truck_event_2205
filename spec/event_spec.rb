require './lib/helper'

RSpec.describe Event do
  let!(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}
  let!(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let!(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let!(:event) {Event.new("South Pearl Street Farmers Market")}

  it "exists" do
    expect(event).to be_instance_of Event
  end

  it "has a name" do
    expect(event.name).to eq("South Pearl Street Farmers Market")
  end
end
