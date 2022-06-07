require 'spec_helper'
require_relative '../lib/food_truck'
require_relative '../lib/item'

RSpec.describe FoodTruck do
  let(:food_truck) { described_class.new('Rocky Mountain Pies') }
  let(:peach_pie) { Item.new({ name: 'Peach Pie', price: "$3.75" }) }
  let(:apple_pie) { Item.new({ name: 'Apple Pie', price: "$2.75" }) }

  it 'has a name' do
    expect(food_truck.name).to eq('Rocky Mountain Pies')
  end

  describe "#inventory" do
    it "is empty by default" do
      expect(food_truck.inventory).to eq({})
    end

    context "with items in inventory" do
      before do
        food_truck.stock(peach_pie, 30)
        food_truck.stock(apple_pie, 50)
      end

      it 'includes peach pie' do
        expect(food_truck.inventory).to have_key(peach_pie)
      end

      it 'includes apple pie' do
        expect(food_truck.inventory).to have_key(apple_pie)
      end
    end
  end

  describe "#stock(item, quantity)" do
    it "adds the item to the inventory" do
      food_truck.stock(peach_pie, 30)
      expect(food_truck.inventory[peach_pie]).to eq(30)
    end
  end

  describe "#check_stock(item)" do
    context "when stocked" do
      before do
        food_truck.stock(peach_pie, 30)
      end

      it "returns the quantity" do
        expect(food_truck.check_stock(peach_pie)).to eq(30)
      end
    end

    context "when NOT stocked" do
      it "returns the quantity" do
        expect(food_truck.check_stock(peach_pie)).to eq(0)
      end
    end
  end
end
