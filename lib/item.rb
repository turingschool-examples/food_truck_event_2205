class Item

  attr_reader :name, :price

  def initialize(input)
    @name = input[:name]
    @price = input[:price][1..-1].to_f
  end

end
