require './lib/item.rb'
require './lib/food_truck.rb'

RSpec.describe FoodTruck do

  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
    expect(@item1).to be_a(Item)
    expect(@item2).to be_a(Item)
  end

  xit ''

end
