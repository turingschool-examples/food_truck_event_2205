class FoodTruck
  attr_reader :name
  def initialize(name)
    @name = name
    @inventory = {}
  end
end
