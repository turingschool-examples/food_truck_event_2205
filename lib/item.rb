class Item
  attr_reader :name, :price

  def initialize(item_options)
    @name = item_options[:name]
    @price = item_options[:price]
  end
end
