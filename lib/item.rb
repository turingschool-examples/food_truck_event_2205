class Item
  attr_reader :name
  
  def initialize(item_data)
    @name = item_data[:name]
  end
end
