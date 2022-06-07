class Item

  attr_accessor :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price][1..-1].to_f
  end

end
