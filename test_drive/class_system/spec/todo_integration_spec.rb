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
end