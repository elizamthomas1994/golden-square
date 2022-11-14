require 'todo_tracker'

RSpec.describe TodoTracker do
  context 'given no tasks' do
    it 'returns an empty list' do
      todo_tracker = TodoTracker.new
      expect(todo_tracker.list).to eq []
    end
  end

  context 'given a task' do
    it 'returns the task in the list' do
      todo_tracker = TodoTracker.new
      todo_tracker.add("Get out of bed")
      expect(todo_tracker.list).to eq ["Get out of bed"]
    end
  end

  context 'given multiple tasks' do
    it 'returns the tasks in the list' do
      todo_tracker = TodoTracker.new
      todo_tracker.add("Get out of bed")
      todo_tracker.add("Get dressed")
      expect(todo_tracker.list).to eq ["Get out of bed", "Get dressed"]
    end
  end

  context 'completing a task' do
    it 'removes the task from the list' do
      todo_tracker = TodoTracker.new
      todo_tracker.add("Get out of bed")
      todo_tracker.add("Get dressed")
      todo_tracker.complete("Get out of bed")
      expect(todo_tracker.list).to eq ["Get dressed"]
    end
  end

  context "completing a non-existant task" do
    it 'returns an error' do
      todo_tracker = TodoTracker.new
      todo_tracker.add("Get dressed")
      expect{ todo_tracker.complete("Get out of bed") }.to raise_error "No task exists"
    end
  end
end