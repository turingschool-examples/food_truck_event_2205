require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  it 'exists' do
    expect(@event).to be_an(Event)
  end

  it 'has a name' do
    expect(@event.name).to eql("South Pearl Street Farmers Market")
  end

  it 'has no food trucks by default' do
    expect(@event.food_trucks).to eql([])
  end

  it 'adds food trucks to the event' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@event.food_trucks).to eql([@food_truck1, @food_truck2, @food_truck3])
    expect(@event.food_trucks.count).to eql(3)
  end

  it 'returns the names of the food trucks' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@event.food_truck_names).to eql(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it 'returns the names of the food trucks' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@event.food_truck_names).to eql(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it 'finds food trucks that sell an item' do
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    require "pry"; binding.pry
    expect(@event.food_trucks_that_sell(@item1).count).to eql(2)
    expect(@event.food_trucks_that_sell(@item4).count).to eql(1)
    expect(@event.food_trucks_that_sell(@item1)).to eql([@food_truck1, @food_truck3])
    expect(@event.food_trucks_that_sell(@item4)).to eql([@food_truck2])
  end

  it 'finds food trucks that sell an item' do
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@event.food_trucks_that_sell(@item1).count).to eql(2)
    expect(@event.food_trucks_that_sell(@item4).count).to eql(1)
    expect(@event.food_trucks_that_sell(@item1)).to eql([@food_truck1, @food_truck3])
    expect(@event.food_trucks_that_sell(@item4)).to eql([@food_truck2])
  end

  it 'finds potential revenue by food truck' do
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@food_truck1.potential_revenue).to eql(148.75)
    expect(@food_truck2.potential_revenue).to eql(345.00)
    expect(@food_truck3.potential_revenue).to eql(243.75)
  end

end
