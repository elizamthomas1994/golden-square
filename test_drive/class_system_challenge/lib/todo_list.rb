class TodoList
  attr_reader :todo_list

  def initialize
  end
  
  def add(todo) # todo is an instance of todo
    # adds todo to todo list
    # returns nothing
  end

  def complete(task) # task is a string representing a complete task
    # Removes completed tasks from the todo list
    # Returns nothing
    # Fails if the task to be completed does not exist
  end
  
  def list
    # returns full list of tasks to be done
  end
end