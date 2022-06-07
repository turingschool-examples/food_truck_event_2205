require 'rspec'
require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  before :each do
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
    expect(@event).to be_a(Event)
  end

  it 'has attributes' do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
    expect(@event.food_trucks).to eq([])
  end

  describe 'iteration 2 (and 3)' do
    before :each do
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3 = FoodTruck.new("Palisade Peach Shack")
      @food_truck3.stock(@item1, 65)
      @food_truck3.stock(@item3, 10)
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
    end

    it 'can add food trucks to event' do
      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end

    it 'can list truck names' do
      expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'can list trucks that sell *item*' do
      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])

    xit 'can check for overstocked items' do
      expect(@event.overstocked_items).to eq(@item1)
    end

    it 'can list items alphabetically, with no doubles' do
      expect(@event.sorted_item_list).to eq(["Peach Pie (Slice)", "Apple Pie (Slice)", "Banana Nice Cream", "Peach-Raspberry Nice Cream"])
    end

    xit 'can check total inventory' do
      expected_hash = {@item1 => {quantity: 100,
                                  food_trucks:@event.food_trucks_that_sell(@item1)},
                       @item2 => {quantity: 100,
                                  food_trucks:@event.food_trucks_that_sell(@item2)},
                       @item3 => {quantity: 100,
                                  food_trucks:@event.food_trucks_that_sell(@item3)},
                       @item4 => {quantity: 100,
                                  food_trucks:@event.food_trucks_that_sell(@item4)}
                     }

      expect(@event.total_inventory).to be_a(Hash)
      expect(@event.total_inventory).to eq(expected_hash)
    end
  end
end
