require 'todo'

RSpec.describe Todo do
  it 'constructs' do
    todo = Todo.new("Wash the dishes")
    expect(todo.task).to eq "Wash the dishes"
  end

  describe '#mark_done!' do
    context 'when task is complete' do
      it 'marks todo as done' do
        todo_1 = Todo.new("Wash the dishes")
        todo_1.mark_done!
        expect(todo_1.done?).to eq true
      end
    end

    context 'when task is not complete' do
      it 'does nothing' do
        todo_1 = Todo.new("Clean the car")
        expect(todo_1.done?).to eq false
      end
    end
  end
end