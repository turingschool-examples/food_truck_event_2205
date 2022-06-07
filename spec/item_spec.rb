require './lib/item'
require './lib/food_truck'

RSpec.describe Item do
    let(:item_1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item_2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

    it 'exists' do
        expect(item_1).to be_a(Item)
    end

    it 'has a name' do
        expect(item_1.name).to eq('Peach Pie (Slice)') 
    end

    it 'has a price' do
        expect(item_1.price).to eq(3.75) 
    end
end