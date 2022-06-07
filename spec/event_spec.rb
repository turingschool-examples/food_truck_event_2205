require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'pry'

RSpec.describe Event do
  before :each do
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'is an Event' do
    expect(@event).to be_instance_of(Event)
  end
end
