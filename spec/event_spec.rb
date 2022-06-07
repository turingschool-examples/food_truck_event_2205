require 'pry'
require 'RSpec'
require './lib/item'
require './lib/food_truck'
require './lib/event'

describe Event do
  before :each do
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @food_truck3.stock(@item1, 65)
  end
  it "exists and has a name" do
    expect(@event).to be_a Event
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end
  it "starts with an empty food truck array" do
    expect(@event.food_trucks).to eq([])
  end
  it "can add food trucks to the array" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_trucks[0]).to be_a FoodTruck
    expect(@event.food_trucks.length).to eq(3)
  end
  it "can return an array of food truck names" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end
  it "can return an array of food trucks that sell an item" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_trucks_that_sell(@item1).length).to eq(2)
    expect(@event.food_trucks_that_sell(@item1)[0]).to be_a FoodTruck
    expect(@event.food_trucks_that_sell(@item4).length).to eq(1)
  end
  it "can return overstocked items (more than i truck sells, q > 50)" do
    @food_truck3.stock(@item3, 10)

    expect(@event.overstocked_items).to be_a Array
    expect(@event.overstocked_items.length).to eq(1)
    expect(@event.overstocked_items[0]).to be_a Item
  end
end
