require 'spec_helper'
require_relative '../lib/food_truck'

RSpec.describe FoodTruck do
  let(:food_truck) { described_class.new('Rocky Mountain Pies') }

  it 'has a name' do
    expect(food_truck.name).to eq('Rocky Mountain Pies')
  end
end
