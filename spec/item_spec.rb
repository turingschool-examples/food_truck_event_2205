require './lib/item'

RSpec.describe Item do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: "$2.50"})
  end

  it "exists" do
    expect(@item1).to be_instance_of(Item)
    expect(@item2).to be_instance_of(Item)
  end

  it "returns the item name" do
    expect(@item1.name).to eq("Peach Pie (Slice)")
    expect(@iten2.name).to eq("Apple Pie (Slice)")
  end

  it "returns the item price" do
    expect(@item1.price).to eq("$3.75")
    expect(@iten2.price).to eq("$2.50")
  end
end
