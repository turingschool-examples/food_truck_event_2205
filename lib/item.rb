class Item
  attr_reader :name

  def initialize(info)
    @name = info[:name]
    # @price = price
  end

end
