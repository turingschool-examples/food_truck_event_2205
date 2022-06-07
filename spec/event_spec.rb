require 'pry'
require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
    before :each do
        @event = Event.new("South Pearl Street Farmers Market")

        @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
        @food_truck3 = FoodTruck.new("Palisade Peach Shack") 

        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    end

    it 'exists and has attributes' do
        expect(@event).to be_a Event
        expect(@event.name).to eq "South Pearl Street Farmers Market"
        expect(@event.food_trucks).to eq([])
    end

    it 'can add food trucks with their stock' do
        @food_truck1.stock(@item1, 35) 
        @food_truck1.stock(@item2, 7)

        @food_truck2.stock(@item4, 50) 
        @food_truck2.stock(@item3, 25)

        @food_truck3.stock(@item1, 65) 

        @event.add_food_truck(@food_truck1)  
        @event.add_food_truck(@food_truck2)  
        @event.add_food_truck(@food_truck3)  

        expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
        expect(@event.food_trucks.first.inventory).to eq({@item1 => 35, @item2 =>7})
    end

    it 'return an array of truck names' do
        @food_truck1.stock(@item1, 35) 
        @food_truck1.stock(@item2, 7)

        @food_truck2.stock(@item4, 50) 
        @food_truck2.stock(@item3, 25)

        @food_truck3.stock(@item1, 65) 

        @event.add_food_truck(@food_truck1)  
        @event.add_food_truck(@food_truck2)  
        @event.add_food_truck(@food_truck3) 

        expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'can search truck invenotries for specific items and 
        return an array of trucks that sell thos items' do
            
            @food_truck1.stock(@item1, 35) 
            @food_truck1.stock(@item2, 7)
    
            @food_truck2.stock(@item4, 50) 
            @food_truck2.stock(@item3, 25)
    
            @food_truck3.stock(@item1, 65) 
    
            @event.add_food_truck(@food_truck1)  
            @event.add_food_truck(@food_truck2)  
            @event.add_food_truck(@food_truck3) 

            expect(@event.food_trucks_that_sell(@item1)).to be_a Array
            expect(@event.food_trucks_that_sell(@item1).length).to eq(2)
            expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
            expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
            expect(@event.food_trucks_that_sell(@item5)).to eq([])
        end

    it 'can calculate potential revenue' do
        @food_truck1.stock(@item1, 35) 
        @food_truck1.stock(@item2, 7)

        @food_truck2.stock(@item4, 50) 
        @food_truck2.stock(@item3, 25)

        @food_truck3.stock(@item1, 65) 

        @event.add_food_truck(@food_truck1)  
        @event.add_food_truck(@food_truck2)  
        @event.add_food_truck(@food_truck3) 

        expect(@food_truck1.potential_revenue).to eq 148.75
        expect(@food_truck2.potential_revenue).to eq 345.00
        expect(@food_truck3.potential_revenue).to eq 243.75
    end

    it 'find the total quantity of an item across all trucks' do
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
        @food_truck3.stock(@item_3, 10)
        
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.item_sums).to eq({@item_1 => 100, @item_2 => 7, @item_4 => 50, @item_3 => 35})
    end

    it 'can return items that are sold by more that 1 food truck && over 50' do
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
        @food_truck3.stock(@item_3, 10)
        
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.overstocked_items).to eq([@item_1])
    end


    it 'can return a alphabetized array' do
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
        @food_truck3.stock(@item_3, 10)
        
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.sorted_item_list).to be_a Array
        expect(@event.sorted_item_list.length).to eq 4
    end

    it 'can return the total inventory of all the items and the trucks that carry them' do
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
        @food_truck3.stock(@item_3, 10)
        
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.total_inventory).to be_a Hash
        expect(@event.total_inventory.length).to eq(4)
        expect(@event.total_inventory.keys).to eq([@item_1,@item_2,@item_4,@item_3])
    end

end