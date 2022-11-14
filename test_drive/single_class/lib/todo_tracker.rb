class TodoTracker
  def initialize
    @todo = []
  end
  
  def add(task) # task is a string representing todo item
    # adds task to todo list
    # returns nothing
    @todo << task
  end

  def complete(task) # task is a string representing a complete task
    # Removes completed tasks from the todo list
    # Returns nothing
    # Fails if the task to be completed does not exist
    fail "No task exists" unless @todo.include? task
    @todo.delete(task)
  end
  
  def list
    # returns full list of tasks to be done
    return @todo
  end
end