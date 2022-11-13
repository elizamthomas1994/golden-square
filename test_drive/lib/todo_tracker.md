1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

```ruby
class TodoTracker
  def initialize
  end

  def add(task) # task is a string representing todo item
    # adds task to todo list
    # returns nothing
  end

  def list
    # returns full list of tasks to be done
  end

  def complete(task) # task is a string representing a complete task
    # Removes completed tasks from the todo list
    # Returns nothing
    # Fails if the task to be completed does not exist
  end
end
```
3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

```ruby
# 1
todo_tracker = TodoTracker.new
todo_tracker.list # => []

# 2
todo_tracker = TodoTracker.new
todo_tracker.add("Clean dishes")
todo_tracker.list # => ["Clean dishes"]

# 3
todo_tracker = TodoTracker.new
todo_tracker.add("Clean dishes")
todo_tracker.add("Clean the car")
todo_tracker.list # => ["Clean dishes", "Clean the car"]

# 4
todo_tracker = TodoTracker.new
todo_tracker.add("Get out of bed")
todo_tracker.add("Get dressed")
todo_tracker.complete("Get out of bed")
todo_tracker.list # => ["Get dressed"]

# 5
todo_tracker = TodoTracker.new
todo_tracker.add("Get out of bed")
todo_tracker.complete("Get dressed")
todo_tracker.list # fails "No task exists"
```

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.