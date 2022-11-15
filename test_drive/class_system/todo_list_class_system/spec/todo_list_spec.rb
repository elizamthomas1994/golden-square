require 'todo_list'

RSpec.describe TodoList do
  context 'initially' do
    it 'takes empty list of todos' do
      todo_list = TodoList.new
      expect(todo_list.incomplete).to eq []
    end
  end

  context 'when we take a single task' do
    it 'takes list of tasks' do
      todo_list = TodoList.new
      expect(todo_list.add("Wash the dishes")).to eq ["Wash the dishes"]
    end
  end

  context 'when we take a single task' do
    it 'takes list of tasks' do
      todo_list = TodoList.new
      todo_1 = Todo.new('Wash the dishes')
      todo_2 = Todo.new('Clean the car')
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.incomplete).to eq [todo_1, todo_2]
    end
  end

  context 'when we take a single task' do
    it 'takes list of tasks' do
      todo_list = TodoList.new
      todo_1 = Todo.new('Wash the dishes')
      todo_list.add(todo_1)
      expect(todo_list.incomplete).to eq [todo_1]
    end
  end
end