require './lib/food_truck'
require './lib/item'
require './lib/event'
require 'rspec'

RSpec.describe Event do

  before (:each) do
    @event = Event.new("South Pearl Street Farmers Market")

    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")

    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @item5 = Item.new({name: 'Onion Pie', price: '$25.00'})

    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)

    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)

    @food_truck3.stock(@item1, 65)
    @food_truck3.stock(@item3, 10)
  end

  it 'exists' do
    expect(@event).to be_instance_of(Event)
  end

  it 'returns name' do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end

  it 'initializes with empty array of food trucks' do
    expect(@event.food_trucks).to eq([])
  end

  it 'can add food trucks to the event' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_trucks).to eq([@food_truck1,@food_truck2,@food_truck3])
  end

  it 'can return names of food trucks at event' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_truck_names).to eq(["Rocky Mountain Pies","Ba-Nom-a-Nom","Palisade Peach Shack"])
  end

  it 'returns all trucks that sell given item' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1,@food_truck3])

    expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
  end

  it 'returns array of all items sold at event' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
  end

  it 'returns if true if given item sold by more than one truck' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.sold_by_more_than_one_truck?(@item1)).to be true

    expect(@event.sold_by_more_than_one_truck?(@item2)).to be false
  end

  it 'returns total inventory of an item' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.total_inventory_by_item(@item1)).to eq(100)
    expect(@event.total_inventory_by_item(@item2)).to eq(7)
    expect(@event.total_inventory_by_item(@item3)).to eq(35)
    expect(@event.total_inventory_by_item(@item4)).to eq(50)
  end

  it 'returns array of all item objects' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.all_items_on_sale.include?(@item1)).to be true
    expect(@event.all_items_on_sale.include?(@item2)).to be true
    expect(@event.all_items_on_sale.include?(@item3)).to be true
    expect(@event.all_items_on_sale.include?(@item4)).to be true
    expect(@event.all_items_on_sale.include?(@item5)).to be false
  end

  it 'returns overstocked items' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.overstocked_items).to eq([@item1])
  end

  it 'returns total inventory for event' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.total_inventory).to eq ({
        @item1 => {
          quantity: 100,
          food_trucks: [@food_truck1,@food_truck3]
        },
        @item2 => {
          quantity: 7,
          food_trucks: [@food_truck1]
        },
        @item4 => {
          quantity: 50,
          food_trucks: [@food_truck2]
        },
        @item3 => {
          quantity: 35,
          food_trucks: [@food_truck2,@food_truck3]
        }
      })
  end

  it 'returns date of event' do
    expect(@event.date).to eq("12/12/1912")
  end

  it 'returns false when stock is lower than sell amount' do
    expect(@event.sell(@item1, 200)).to be false
    expect(@event.sell(@item5, 1)).to be false
  end

  it 'returns true if stock is available' do
    expect(@event.sell(@item4, 5)).to be true
  end

end
