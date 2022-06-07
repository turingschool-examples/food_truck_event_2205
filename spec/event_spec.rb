require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'date'

RSpec.describe Event do
  let(:event) {Event.new("South Pearl Street Farmers Market")}

  let(:food_truck1) {FoodTruck.new("Rocky Mountain Pies")}
  let(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
  let(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}

  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let(:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}

  before :each do
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
  end

  it 'exists' do
    expect(event).to be_a(Event)
    expect(event.food_trucks).to eq([])
  end

  it 'can add food trucks' do
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
  end

  it 'returns food truck names' do
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it 'has food trucks that sell certain items' do
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
  end

  it 'can get a sorted_item_list' do
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expect(event.sorted_item_list).to eq([item2, item4, item1, item3])
  end

  it 'can get overstocked_items' do
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expect(event.overstocked_items).to eq([item1])
  end

  it 'has an array of all item objects' do
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expect(event.items_array.size).to eq(4)
    expect(event.items_array.first.name).to eq("Peach Pie (Slice)")
  end

  it 'can get total_inventory' do
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expected = {
      item1 => {quantity: 100,
                food_trucks: [food_truck1, food_truck3]
              },
      item2 => {quantity: 7,
                food_trucks: [food_truck1]
              },
      item4 => {quantity: 50,
                food_trucks: [food_truck2]
      },
      item3 => {quantity: 35,
                food_trucks: [food_truck2, food_truck3]
          }
        }
    expect(event.total_inventory).to eq(expected)
  end

  it 'can get the event date' do
    allow(Date).to receive(:today).and_return Date.new(1993,5,12)
    expect(event.date).to eq("1993-05-12")
  end
end
