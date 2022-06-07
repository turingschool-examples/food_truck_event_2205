require './lib/item'
require './lib/food_truck'
require './lib/event'
require "rspec"

RSpec.describe Event do
  it "exists" do
    event = Event.new("South Pearl Street Farmers Market")
    expect(event).to be_instance_of(Event)
  end
  it "can return the events name" do
    event = Event.new("South Pearl Street Farmers Market")
    expect(event.name).to eq("South Pearl Street Farmers Market")
  end

  it "can add and return the number of food trucks" do
    event = Event.new("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    event.add_food_truck(food_truck1)
    expect(event.food_trucks.length).to eq(1)
    event.add_food_truck(food_truck2)
    expect(event.food_trucks.length).to eq(2)
  end
  it "can return the names of the food trucks" do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    expect(event.food_truck_names).to eq(["Rocky Mountain Pies","Ba-Nom-a-Nom"])
  end
  it "can return what food truck stocks what item" do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    event.add_food_truck(food_truck1)
    expect(event.food_trucks.length).to eq(1)
    event.add_food_truck(food_truck2)
    expect(event.food_trucks.length).to eq(2)
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    food_truck1.stock(item1, 35)
    food_truck2.stock(item3, 7)
    expect(event.food_trucks_that_sell(item1).count).to eq(1)
    expect(event.food_trucks_that_sell(item3).count).to eq(1)
  end

  xit "can return the overstocked items" do
     event = Event.new("South Pearl Street Farmers Market")
     item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
     item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
     item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
     item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
     food_truck1 = FoodTruck.new("Rocky Mountain Pies")
     food_truck1.stock(item1, 35)
     food_truck1.stock(item2, 7)
     food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
     food_truck2.stock(item4, 50)
     food_truck2.stock(item3, 25)
     food_truck3 = FoodTruck.new("Palisade Peach Shack")
     food_truck3.stock(item1, 65)
     food_truck3.stock(item3, 10)
     event.add_food_truck(food_truck1)
     event.add_food_truck(food_truck2)
     event.add_food_truck(food_truck3)
     expect(event.overstocked_items.count).to eq(1)
  end

  xit "can return the items of all food trucks in a sorted list " do
    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expect(event.sorted_item_list.count).to eq (4)
  end

  it " can return the total inventory of all food trucks" do
    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expect(event.total_inventory).to be_instance_of(Hash)
  end
end
