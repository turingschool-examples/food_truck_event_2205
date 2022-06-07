class Item
  attr_reader :name, :price
# HUGE DISCLAIMER: I accidentally cloned the original repo. I had to created a new
#directory, copy and paste my code in there, then delete the original
#then fork and reclone, and then copy and paste my code back in.
  def initialize(info)
    @name = info[:name]
    @price = info[:price].to_f + 2.50 #temp
  end

end
