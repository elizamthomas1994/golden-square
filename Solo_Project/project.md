1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

2. Design the Class System

```ruby
class Menu
  def initialize 
  end

  def add(dish)
    # dish is an instance of Dish
    # returns nothing
  end

  def list 
    # Returns a list of all added instances of Dish.
    # Includes both the dish name and the price.
  end
end

class Dish
  def initialize(dish, price) 
    # dish is a string representing menu item
    # price is an integer representing price of dish item
  end

  def dish
    # returns dish
  end

  def price
    # returns price
  end
end

class Order
  def initialize(menu)
    # menu represents the menu object
  end

  def order_request(dish)
    # selects given dishes and adds them to the order
    # fails if ordered item is not on the menu
  end

  def total_order
  end
end

class OrderConfirmation
end
```

3. Create Examples as Integration Tests

```ruby
# Menu#list returns a single dish if the menu only contains one dish
menu = Menu.new
dish_1 = Dish.new("Pizza", 8.50)
menu.add(dish_1)
expect(menu.list).to eq ([dish_1])

# Menu#list returns all given dishes added to menu
menu = Menu.new
dish_1 = Dish.new("Pizza", 8.50)
dish_2 = Dish.new("Lasagne", 10.00)
dish_3 = Dish.new("Spaghetti Bolognese", 12.25)
menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
expect(menu.list).to eq ([dish_1, dish_2, dish_3])

# Order#total_order returns one item if customer only orders 1 dish
menu = Menu.new
dish_1 = Dish.new("Pizza", 8.50)
dish_2 = Dish.new("Lasagne", 10.00)
dish_3 = Dish.new("Spaghetti Bolognese", 12.25)
menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
order = Order.new(menu)
order.order_request(dish_1)
expect(order.total_order).to eq [dish_1]

#Order#total_order returns error if customer orders dish not on menu
menu = Menu.new
dish_1 = Dish.new("Pizza", 8.50)
dish_2 = Dish.new("Lasagne", 10.00)
dish_3 = Dish.new("Spaghetti Bolognese", 12.25)
menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
order = Order.new(menu)
order.order_request(dish_3)
expect{(order.total_order)}.to raise_error "Cannot order dish not on menu!"

# further imtegration tests to be implemented in future GitHub commits
```
4. Create Examples as Unit Tests

```ruby 
# Menu#list returns empty list if no dishes are added
menu = Menu.new('title', '')
expect(menu.list).to eq([])

# Dish#dish_name returns name of given dish
dish_1 = Dish.new("Pizza", 8.50)
expect(dish_1.dish_name).to eq "Pizza"

# Dish#dish_price returns price of given dish
dish_1 = Dish.new("Pizza", 8.50)
expect(dish_1.dish_price).to eq 8.50

# further unit tests to be implemented in future GitHub commits
```

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.