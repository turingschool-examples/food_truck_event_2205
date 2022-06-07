class Item
  attr_reader :name, :price

  def initialize(data_from_hash)
    @name = data_from_hash[:name]
    @price = data_from_hash[:price]
  end
end
