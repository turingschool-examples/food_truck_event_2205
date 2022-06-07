require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item_3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @event = Event.new("South Pearl Street Farmers Market")
  end

  it 'exists' do
    expect(@event).to be_a(Event)
  end

  it 'has a name' do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end

  it 'returns the food trucks at the event' do
    expect(@event.food_trucks).to eq([])
  end
end
