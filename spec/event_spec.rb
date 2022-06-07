require 'spec_helper'
require_relative '../lib/food_truck'
require_relative '../lib/event'

RSpec.describe Event do
  let(:event) { described_class.new }
  let(:food_truck) { FoodTruck.new("Rocky Mountain Pies") }

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
end
