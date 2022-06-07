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
end
