require 'menu'
require 'dish'
require 'order'

RSpec.describe 'integration' do
  context 'given a single dish on the menu' do
    it 'returns given dish' do
      menu = Menu.new
      dish_1 = Dish.new("Pizza", 8.50)
      menu.add(dish_1)
      expect(menu.list).to eq ([dish_1])
    end
  end

  context 'given multiple dishes on the menu' do
    it 'returns all given dishes' do
      menu = Menu.new
      dish_1 = Dish.new("Pizza", 8.50)
      dish_2 = Dish.new("Lasagne", 10.00)
      dish_3 = Dish.new("Spaghetti Bolognese", 12.25)
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      expect(menu.list).to eq ([dish_1, dish_2, dish_3])
    end
  end

  context 'customer orders single dish from the menu' do
    it 'adds single dish to customer order and returns the requested dish' do
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
    end
  end

  context 'customer orders multiple dishes from the menu' do
    it 'adds multiple dishes to customer order and outputs the requested dishes' do
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
    end
  end

  context 'if customer requests a dish that is not on the menu' do
    it 'returns error' do
      menu = Menu.new
      dish_1 = Dish.new("Pizza", 8.50)
      dish_2 = Dish.new("Lasagne", 10.00)
      dish_3 = Dish.new("Spaghetti Bolognese", 12.25)
      menu.add(dish_1)
      menu.add(dish_2)
      order = Order.new(menu)
      order.order_request(dish_3)
      expect{ (order.total_order) }.to raise_error "Requested dish not on the menu!"
    end
  end
end