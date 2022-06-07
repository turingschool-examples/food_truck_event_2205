require './lib/item'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
    expect(@item1).to be_an(Item)
  end

  it 'has a name' do
    expect(@item2.name).to eql('Apple Pie (Slice)')
  end

  it 'has a price' do
    expect(@item2.price).to eql(2.50)
  end

end
