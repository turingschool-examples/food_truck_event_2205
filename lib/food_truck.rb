class FoodTruck
  attr_reader :name,
              :inventory,
              :items
  def initialize(name)
    @name = name
    @inventory = {}
    @items = []
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

  end


  def check_stock(item)
    @inventory.find_all do |item|
    if item.name == item
      return item.count
      end
    end
  end

  def stock(item, num)

  end

end
