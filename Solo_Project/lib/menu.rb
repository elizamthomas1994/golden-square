class Menu
  def initialize 
    @menu = []
  end

  def add(dish)
    # dish is an instance of Dish
    # returns nothing
    @menu << dish
  end

  def list 
    # Returns a list of all added instances of Dish.
    # Includes both the dish name and the price.
    @menu
  end
end