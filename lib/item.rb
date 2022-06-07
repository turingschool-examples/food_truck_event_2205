class Item

  attr_reader :name, :price, :quantity

  def initialize(attributes, quantity = 0)
    @name = attributes[:name]
    @price = attributes[:price][-4..-1].to_f
    @quantity = attributes[:quantity].to_i
  end

end
