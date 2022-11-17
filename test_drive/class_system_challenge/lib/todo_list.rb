class TodoList
  def initialize
    @todo_list = []
  end
  
  def add(todo) # todo is an instance of todo
    # adds todo to todo list
    # returns nothing
    @todo_list << todo
  end

  def complete(todo) # todo is a string representing a complete todo
    # Removes completed todo from the todo list
    # Returns nothing
    # Fails if the task to be completed does not exist
    fail "Todo not recognised" if @todo_list.include?(todo) == false
    @todo_list.delete(todo)
  end
  
  def list
    # returns full list of tasks to be done
    @todo_list
  end
end