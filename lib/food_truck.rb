class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.include?(item)
      all_num_of_item = @inventory.find_all do |item_instance|
        item_instance == item
      end
      all_num_of_item.count
    else
      0
    end
  end

  def stock(item, quantity)
    @inventory[item] = quantity
  end
end
