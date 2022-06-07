require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
    before :each  do
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    end

    it 'exists' do
      expect(@event).to be_a(Event)
    end

    it 'has a name' do
      expect(@event.name).to eq("South Pearl Street Farmers Market")
    end

    it 'can list food trucks at the event' do
      expect(@event.food_trucks).to eq([])
    end

    it 'can add food trucks' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end

    it 'can list food trucks by name' do
      expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
end
