require_relative 'item'
require_relative 'food_truck'

class Event
  attr_accessor :name

  def initialize(name)
    @name = name
  end

end
