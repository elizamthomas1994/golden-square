class Order
  def initialize(menu)
    @order = []
    @menu = menu
  end

  def order_request(dish)
    # selects given dishes and adds them to the order
    # fails if ordered item is not on the menu
    fail "Requested dish not on the menu!" if @menu.list.include?(dish) != true
    if @menu.list.include?(dish) == true
      @order << dish
    end
  end

  def total_order
    @order
  end
end