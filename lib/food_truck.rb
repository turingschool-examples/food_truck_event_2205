class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name

    #maybe??
    # i know this is wrong but i dont know how to fix it
    @inventory = {}
  end

  def stock
    @stock = Item.new({item: item, qty: qty})
    @inventory << stock
  end
end
