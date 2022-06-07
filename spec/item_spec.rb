require './lib/item'
require "rspec"

RSpec.describe Item do

  it "exists" do
    data = ({name: 'Peach Pie (Slice)', price: "$3.75"})
    item = Item.new(data)
    expect(item).to be_instance_of(Item)
  end
  it "can return the details of an item" do
    data = ({name: 'Peach Pie (Slice)', price: "$3.75"})
    item = Item.new(data)
    expect(item.name).to eq("Peach Pie (Slice)")
    expect(item.price).to eq(3.75)
  end

end
