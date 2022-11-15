class TodoList
  attr_reader :todo_list
  def initialize
    @todo_list = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @todo_list << todo
  end

  def incomplete
    # Returns all non-done todos
    @todo_list.select { |todo| todo.done? == false }
  end

  def complete
    # Returns all complete todos
    @todo_list.select { |todo| todo.done? == true }
  end

  def give_up!
    # Marks all todos as complete
    @todo_list.each do |todo|
      todo.mark_done!
    end
  end
  
end