require "./lib/item"
require "./lib/food_truck"


RSpec.describe(Item) do
  before(:each) do
    @item1 = Item.new({name: "Peach Pie (Slice)", price: "$3.75"})
    @item2 = Item.new({name: "Apple Pie (Slice)", price: "$2.50"})
  end

  it(("#exists")) do
    expect(@item1).to(be_a(Item))
    expect(@item2).to(be_a(Item))
  end

  it("#name of pie in item 2") do
    expect(@item2.name).to(eq("Apple Pie (Slice)"))
  end

# needs to be a float
  it("#price of pie in item2") do
    expect(@item2.price).to(eq("$2.50"))
  end
end
