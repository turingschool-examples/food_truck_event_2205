require './lib/item'
require './lib/food_truck'
require './lib/event'


RSpec.describe Event do
  it 'exists and has attributes' do
    event = Event.new("South Pearl Street Farmers Market")
    expect(event).to be_a Event
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    expect(item1).to be_a Item
    expect(item2).to be_a Item
    expect(item3).to be_a Item
    expect(item4).to be_a Item
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    expect(food_truck1).to be_a FoodTruck
    expect(food_truck2).to be_a FoodTruck
    expect(food_truck3).to be_a FoodTruck
    event = Event.new("South Pearl Street Farmers Market")
  end
  #this looks incredibly messy but I had to rush

  it 'has a name' do
    event = Event.new("South Pearl Street Farmers Market")
    expect(event.name).to eq("South Pearl Street Farmers Market")
  end

  it 'has an array of trucks' do
    event = Event.new("South Pearl Street Farmers Market")
    expect(event.food_trucks).to be_a Array
  end

  it 'it can add food trucks' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
  end
end
