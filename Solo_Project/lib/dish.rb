class Dish
  def initialize(dish, price) 
    # dish is a string representing menu item
    # price is an integer representing price of dish item
    @dish = dish
    @price = price
  end

  def dish_name
    # returns dish
    @dish
  end

  def dish_price
    # returns price
    @price
  end
end