class Item
  attr_reader :name, :price
  def initialize(the_item)
    @item = the_item
    @name = the_item[:name]
    @price = the_item[:price] #to_i
  end
end
