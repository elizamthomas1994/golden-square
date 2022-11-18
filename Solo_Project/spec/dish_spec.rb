require 'dish'

RSpec.describe Dish do
  describe '#dish_name' do
    it 'returns the name of the dish' do
      dish_1 = Dish.new("Pizza", 8.50)
      expect(dish_1.dish_name).to eq "Pizza"
    end
  end

  describe '#dish_price' do
    it 'returns the price of the dish' do
      dish_1 = Dish.new("Pizza", 8.50)
      expect(dish_1.dish_price).to eq 8.50
    end
  end
end