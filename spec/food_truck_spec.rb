require 'pry'
require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
    before :each do
        @food_truck = FoodTruck.new("Rocky Mountain Pies")

        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    end

    it 'exists and has attributes' do
        expect(@food_truck).to be_a FoodTruck
        expect(@food_truck.name).to eq "Rocky Mountain Pies"
        expect(@food_truck.inventory).to eq({})
    end

    it 'can check the stock' do
        expect(@food_truck.check_stock(@item1)).to eq 0
    end

    it 'can add inventory to stock and add to inventory count' do
        @food_truck.stock(@item1, 30)

        expect(@food_truck.check_stock(@item1)).to eq 30
        expect(@food_truck.inventory).to eq({@item1 => 30})

        @food_truck.stock(@item1, 25)

        expect(@food_truck.check_stock(@item1)).to eq 55
        expect(@food_truck.inventory).to eq({@item1 => 55})

        @food_truck.stock(@item2, 12)

        expect(@food_truck.check_stock(@item2)).to eq 12
        expect(@food_truck.inventory).to eq({@item1 => 55, @item2 =>12})
    end

    it 'can calculate potential revenue' do
        @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
        @food_truck3 = FoodTruck.new("Palisade Peach Shack") 

        @item_1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item_2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @item_3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item_4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

        @food_truck1.stock(@item_1, 35) 
        @food_truck1.stock(@item_2, 7)

        @food_truck2.stock(@item_4, 50) 
        @food_truck2.stock(@item_3, 25)

        @food_truck3.stock(@item_1, 65) 

        expect(@food_truck1.potential_revenue).to eq 148.75
        expect(@food_truck2.potential_revenue).to eq 345.00
        expect(@food_truck3.potential_revenue).to eq 243.75
    end

end