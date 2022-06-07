class Item
  attr_reader :name,
              :price
  def initialize(data)
    @price = data[:price].delete('$').to_f
    @name = data[:name]
  end
end
