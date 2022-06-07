require './lib/food_truck'
require './lib/item'
require './lib/event'
require 'rspec'

RSpec.describe Event do

  before (:each) do
    @event = Event.new("South Pearl Street Farmers Market")
  end

  it 'exists' do
    expect(@event).to be_instance_of(Event)
  end

  it 'returns name' do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end

end
