require './lib/helper'

RSpec.describe Event do
  let!(:food_truck1) {FoodTruck.new("Rocky Mountain Pies")}
  let!(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
  let!(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}
  let!(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let!(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let!(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let!(:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}
  let!(:event) {Event.new("South Pearl Street Farmers Market")}

  describe "Iteration 2" do
    it "exists" do
      expect(event).to be_instance_of Event
    end

    it "has a name" do
      expect(event.name).to eq("South Pearl Street Farmers Market")
    end

    it "has food trucks in an array" do
      expect(event.food_trucks).to eq([])
    end

    it "can add food trucks to the event" do
      expect(event.food_trucks).to eq([])
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
    end

    it "can return the names of food trucks at the event" do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it "can return food trucks that sell a particular item" do
      food_truck1.stock(item1, 35)
      food_truck3.stock(item1, 65)
      food_truck2.stock(item4, 20)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
      expect(event.food_trucks_that_sell(item4)).to eq([food_truck2])
    end

    it "can return potential revenue of each food truck" do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(food_truck1.potential_revenue(food_truck1)).to eq(148.75)
      expect(food_truck2.potential_revenue(food_truck1)).to eq(345.00)
      expect(food_truck3.potential_revenue(food_truck1)).to eq(243.75 )
    end
  end

  describe "Iteration 3" do
    xit "can return potential revenue of each food truck" do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      event.test_map
      require "pry"; binding.pry
      expect(food_truck1.overstocked_items).to eq(148.75)
    end

    it "can return a sorted array of items" do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
    end
  end
end
