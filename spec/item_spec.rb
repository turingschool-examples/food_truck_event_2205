require './lib/item'
require 'rspec'

RSpec.describe Item do

  before (:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
    expect(@item1).to be_instance_of(Item)
  end

  it 'returns item name' do
    expect(@item2.name).to eq('Apple Pie (Slice)')
  end

  it 'returns item price' do
    expect(@item2.price).to eq(2.50)
  end

end
