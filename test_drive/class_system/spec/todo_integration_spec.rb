require 'todo_list'
require 'todo'

RSpec.describe 'integration' do
  it 'adds todos to the todo list' do
    todo_list = TodoList.new
    todo_1 = Todo.new("Wash the dishes")
    todo_2 = Todo.new("Clean the car")
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    expect(todo_list.incomplete).to eq [todo_1, todo_2]
  end

  describe 'task completing behaviour' do
    it 'marks tasks as complete' do
      todo_list = TodoList.new
      todo_1 = Todo.new("Wash the dishes")
      todo_2 = Todo.new("Clean the car")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_1.mark_done!
      expect(todo_list.complete).to eq [todo_1]
    end
  end

  describe '#incomplete' do
    it 'returns todos that have not been completed' do
      todo_list = TodoList.new
      todo_1 = Todo.new("Wash the dishes")
      todo_2 = Todo.new("Clean the car")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_1.mark_done!
      expect(todo_list.incomplete).to eq [todo_2]
    end
  end

  describe '#give_up!' do
    it 'sets incomplete todos to complete' do
      todo_list = TodoList.new
      todo_1 = Todo.new("Wash the dishes")
      todo_2 = Todo.new("Clean the car")
      todo_3 = Todo.new("Do grocery shopping")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.give_up!
      expect(todo_list.complete).to eq [todo_1, todo_2, todo_3]
    end
  end
end