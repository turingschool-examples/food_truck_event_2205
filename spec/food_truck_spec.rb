require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  describe '#initialize' do
    it 'should initialize an instsance of FoodTruck' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck). to be_instance_of(FoodTruck)
    end
  end

  describe '@name' do
    it 'has a name' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.name).to eq("Rocky Mountain Pies")
    end
  end

  describe '@inventory' do
    it 'has an empty has of inventory' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'can check the number of stocked items' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq(0)

      food_truck.stock(item1, 30)

      expect(food_truck.inventory).to eq({item1 => 30})
      expect(food_truck.check_stock(item1)).to eq(30)
    end
  end

end
