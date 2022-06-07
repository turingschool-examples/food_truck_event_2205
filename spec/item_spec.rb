require './lib/item'


RSpec.describe Item do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it "exists with attributes" do
    expect(@item1).to be_instance_of Item
    expect(@item2).to be_instance_of Item
  end
end
