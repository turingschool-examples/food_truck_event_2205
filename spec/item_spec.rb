require './lib/item'

RSpec.describe Item do
  describe '#initialize' do
    it 'should initialize an instsance of Item' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      expect(item1).to be_instance_of (Item)
    end
  end

  describe '@name' do
    it 'item has a name' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      expect(item2.name). to eq("Apple Pie (Slice)")
    end
  end

  describe '@price' do
    it 'item has a price' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      expect(item2.price).to eq(2.50)
    end
  end
end
