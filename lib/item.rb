require 'pry'
class Item
  attr_reader :name

  def initialize(hash)
    @name = hash[:name]
    @amount = hash[:price]
  end


  def price
    @amount.slice!(0)
    @amount.to_f
  end
end
