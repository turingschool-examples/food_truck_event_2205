require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe FoodTruck do
  before :each do
    @event = Event.new("South Pearl Street Farmers Market")

    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")

    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)

    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)

    @food_truck3.stock(@tem1, 65)
  end

  it "exists" do
    expect(@event).to be_a Event
    expect(@event.name).to eq("South Pearl Street Farmers Market")
    expect(@event.food_trucks).to eq([])
  end

  it "can add food trucks" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
  end

  it "can return food truck names" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it "can return trucks that sell a specific item" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
  end

  it "can calculate potential revenue" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@food_truck1.potential_revenue).to eq(148.75)
    expect(@food_truck2.potential_revenue).to eq(345.00)
    expect(@food_truck3.potential_revenue).to eq(243.75)
  end

  # Iteration 3
  before :each do
    @event2 = Event.new("South Pearl Street Farmers Market")

    @item5 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item6 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item7 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item8 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    @food_truck4 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck5 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck6 = FoodTruck.new("Palisade Peach Shack")

    @food_truck4.stock(@item5, 35)
    @food_truck4.stock(@item6, 7)
    @food_truck5.stock(@item8, 50)
    @food_truck5.stock(@item7, 25)
    @food_truck6.stock(@item5, 65)
    @food_truck6.stock(@item7, 10)

    @event2.add_food_truck(@food_truck4)
    @event2.add_food_truck(@food_truck5)
    @event2.add_food_truck(@food_truck6)
  end


  it "can determine overstocked items" do
    expect(@event2.overstocked_items).to eq([@item5])
  end

  it "can return a sorted item list" do
    expect(@event2.sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
  end

end
