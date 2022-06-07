class Item
  attr_reader :name, :price
  def initialize(data)
    @name = data[:name]
    @price = data[:price].gsub('$','').to_f.round(2)
  end
end
