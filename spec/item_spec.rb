require './lib/item'
require 'rspec'
require 'pry'

RSpec.describe Item do
  it "item exist" do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    expect(item1).to be_a Item
    expect(item2).to be_a Item
  end
end
