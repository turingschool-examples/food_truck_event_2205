class Item
  attr_reader :name, :price
  def initialize(item)
    @name = item[:name]
    @price = item[:price] #.slice(1..4).to_f
  end


end
