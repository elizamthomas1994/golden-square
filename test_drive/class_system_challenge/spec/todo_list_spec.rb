require 'todo_list'

RSpec.describe 'list behaviour' do
  it 'returns an empty list when no todos are added' do
    todo_list = TodoList.new 
    expect(todo_list.list).to eq([])
  end
end