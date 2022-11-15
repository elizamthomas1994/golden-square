require 'task_tracker'

RSpec.describe 'task_tracker method' do
  context 'text takes non-string' do
    it "returns an error" do
      expect{ task_tracker(nil) }.to raise_error "Not a string."
    end
  end
  context 'text takes string that starts with #TODO' do
    it 'returns true' do
      expect(task_tracker("#TODO Clean the dishes")).to eq true
    end
  end
  context 'text takes string that does not include #TODO' do
    it 'returns false' do
      expect(task_tracker("Eat breakfast")).to eq false
    end
  end
  context 'takes takes string that ends with #TODO' do
    it 'returns true' do
      expect(task_tracker("Shop for groceries #TODO")).to eq true
    end
  end
  context 'text takes integer' do
    it 'returns error' do
      expect{ task_tracker(100) }.to raise_error "Not a string."
    end
  end
end