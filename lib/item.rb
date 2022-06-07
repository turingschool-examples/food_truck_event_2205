class Item
  attr_reader :name, :price

  def initialize(details)
    @name = details[:name]
    @price = format_price(details[:price])
  end

  def format_price(price)
    price.split('$').last.to_f
  end
end
