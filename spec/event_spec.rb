require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do

  describe "#Iteration 2" do

    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    it "exists" do
      expect(event).to be_a(Event)
    end

    it "has a name" do
      expect(event.name).to eq("South Pearl Street Farmers Market")
    end

    it "has array of food trucks" do
      expect(event.food_trucks).to eq([])
    end

    it "can have stocked food trucks" do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.food_trucks.first).to be_a(FoodTruck)
      expect(event.food_trucks.last.inventory[item1]).to eq(65)
    end

    it "has food truck names array" do
      expect(event.food_truck_names.first).to eq("Rocky Mountain Pies")
      expect(event.food_truck_names).to be_a(Array)
      expect(event.food_truck_names.length).to eq(3)
    end

    it "has food trucks that sell an item" do
      expect(event.food_trucks_that_sell(item1).length).to eq(2)
      expect(event.food_trucks_that_sell(item4).length).to eq(1)
    end
  end

  describe "#Iteration 3" do

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

    it "has overstocked items" do
      expect(event.overstocked_items.length).to eq(1)
      expect(event.overstocked_items.first).to be_a(Item)
    end

    it "has sorted item list" do
      expect(event.sorted_item_list).to be_a(Array)
      expect(event.sorted_item_list.first).to eq("Apple Pie (Slice)")
      expect(event.sorted_item_list.last).to eq("Peach-Raspberry Nice Cream")
    end

    it "has total inventory" do
      expect(event.total_inventory).to be_a(Hash)
      expect(event.total_inventory.keys.first).to be_a(Item)
      expect(event.total_inventory.values.first[:food_trucks]).to include(FoodTruck)
    end
  end

  describe "#Iteration 4" do

    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    item5 = Item.new({name: 'Onion Pie', price: '$25.00'})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)


    it "has a date" do
      # don't know how to use stubs
      expect(event.date).to be_a(Date)
    end

    xit "can sell" do
      # out of time
      expect(event.sell(item1, 200)).to be(false)
      expect(event.sell(item5, 1)).to be(false)
      expect(event.sell(item4, 5)).to be(true)
      expect(food_truck2.check_stock(item4)).to eq(45)
      expect(event.sell(item1, 40)).to be(true)
      expect(food_truck1.check_stock(item1)).to eq(0)
      expect(food_truck3.check_stock(item1)).to eq(60)
    end
  end

end
