require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
    before :each  do
      @food_truck = FoodTruck.new("Rocky Mountain Pies")
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    end

    it 'exists' do
      expect(@food_truck).to be_a(FoodTruck)
    end

    it 'has a name' do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'has an inventory' do
      expect(@food_truck.inventory).to be_a(Hash)
    end

    it 'can check the stock of items' do
      expect(@food_truck.check_stock(@item1)).to eq(0)
    end

    it 'can stock items in inventory' do
      @food_truck.stock(@item1, 30)
      expect(@food_truck.inventory).to eq({@item1 => 30})
    end

    it 'can check the stock of items in inventory' do
      @food_truck.stock(@item1, 30)
      expect(@food_truck.check_stock(@item1)).to eq(30)
    end

    it 'can add to the stock' do
      @food_truck.stock(@item1, 25)
      expect(@food_truck.stock(@item1)).to eq(55)
    end
end
