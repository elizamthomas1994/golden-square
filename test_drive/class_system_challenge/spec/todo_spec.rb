require 'todo'

RSpec.describe '#initialize' do
  it 'creates an instance of todo' do
    expect(Todo.new('Walk the dog')).to be_an_instance_of(Todo)
  end

  describe '#todo' do
    it 'returns instances of todo' do
      todo_1 = Todo.new('Walk the dog')
      expect(todo_1.todo).to eq('Walk the dog')
    end
  end
end