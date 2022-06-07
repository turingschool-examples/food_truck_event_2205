require 'spec_helper'
require_relative '../lib/food_truck'
require_relative '../lib/event'
require_relative '../lib/item'

RSpec.describe Event do
  let(:event) { described_class.new }
  let(:food_truck) { FoodTruck.new("Rocky Mountain Pies") }
  let(:pie_truck) do
    truck = FoodTruck.new("A La Mode")
    truck.stock(peach_pie, 10)
    truck.stock(apple_pie, 20)
    truck
  end
  let(:peach_pie) { Item.new({ name: 'Peach Pie', price: "$3.75" }) }
  let(:apple_pie) { Item.new({ name: 'Apple Pie', price: "$2.75" }) }

  describe "#add_food_truck(food_truck)" do
    it "adds the truck to the list" do
      event.add_food_truck(food_truck)
    end
  end

  describe "#food_truck_names" do
    context "when there are no food trucks" do
      it "returns no names" do
        expect(event.food_truck_names).to eq([])
      end
    end

    context "when there are food trucks" do
      before do
        event.add_food_truck(food_truck)
      end

      it "returns no names" do
        expect(event.food_truck_names).to include(food_truck.name)
      end
    end
  end

  describe "#food_trucks_that_sell(item)" do
    context "when there are no food trucks that sell it" do
      it "lists no food trucks" do
        event.add_food_truck(food_truck)
        expect(event.food_trucks_that_sell(apple_pie)).to eq([])
      end
    end

    context "when there are food trucks that sell it" do
      it "lists no food trucks" do
        event.add_food_truck(food_truck)
        event.add_food_truck(pie_truck)
        expect(event.food_trucks_that_sell(apple_pie)).to eq([pie_truck])
      end
    end
  end
end
