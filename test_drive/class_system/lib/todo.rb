class Todo
  def initialize(task) # task is a string
    @task = task
    @complete_tasks = []
  end

  def task
    # Returns the task as a string
    returns @task
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @complete_tasks << @task
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    @complete_tasks.include? @task
  end
end