require 'pry'
require_relative 'item'
class FoodTruck
  attr_reader :name, :invatory, :check_stock

  def initialize(name)
    @name = name
    @invatory = Hash.new(0)
    @check_stock = 0
  end

  def check_stock(item)
    invatory[item]
  end

  def stock(item, price)
    @check_stock = @check_stock + price
     invatory[item] = (@check_stock)
  end



  # def check_stock(item)
  #   invatory.values.each do |cost|
  #     @check_stock += cost
  #   end
  #   @check_stock
  # end
 print "i give up like i am done done no more motivation"
end
