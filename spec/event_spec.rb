require './lib/event'
require './lib/food_truck'
require './lib/item'

RSpec.describe do
  before :each do
    @event = Event.new("South Pearl Street Farmers Market")
  end

  it 'is an event instance' do
    expect(@event).to be_instance_of Event
  end

  it 'has a name' do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end
end
