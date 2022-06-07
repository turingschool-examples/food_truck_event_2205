
class Item
  attr_reader :name, :price
  attr_accessor

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price].delete('$').to_f
  end
end
