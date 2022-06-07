class Item
  attr_reader :name, :price

  def initialize(item)
    @name = item[:name]
    @price = item[:price][1..5].to_f
  end
end
