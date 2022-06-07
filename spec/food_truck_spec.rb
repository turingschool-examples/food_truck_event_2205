require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

  it 'exists & has attributes' do
    expect(food_truck).to be_a(FoodTruck)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end

  it 'can check stock' do
    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it 'can  add stock' do
    expected = {
      item1 => 33,
      item2 => 40
    }

    food_truck.stock(item1, 15)
    food_truck.stock(item2, 40)
    food_truck.stock(item1, 18)
    expect(food_truck.check_stock(item1)).to eq(33)
    expect(food_truck.check_stock(item2)).to eq(40)
    expect(food_truck.inventory).to eq(expected)
  end
end
