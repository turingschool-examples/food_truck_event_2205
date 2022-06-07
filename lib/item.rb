class Item
  attr_reader :name,
              :price
  def initialize(attributes)
    @attributes = attributes
    @name = attributes[:name]
    @price = attributes[:price].delete("$").to_f
  end
end
