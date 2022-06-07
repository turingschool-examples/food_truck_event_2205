require 'spec_helper'
require_relative '../lib/food_truck'
require_relative '../lib/item'

RSpec.describe FoodTruck do
  let(:food_truck) { described_class.new('Rocky Mountain Pies') }
  let(:peach_pie) { Item.new({ name: 'Peach Pie', price: "$3.75" }) }

  it 'has a name' do
    expect(food_truck.name).to eq('Rocky Mountain Pies')
  end

  describe "#inventory" do
    it "is empty by default" do
      expect(food_truck.inventory).to eq({})
    end
  end

  describe "#stock(item, quantity)" do
    it "adds the item to the inventory" do
      food_truck.stock(peach_pie, 30)
      expect(food_truck.inventory[peach_pie]).to eq(30)
    end
  end
end
