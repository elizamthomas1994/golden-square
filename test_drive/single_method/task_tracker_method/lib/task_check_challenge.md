{{PROBLEM}} Method Design Recipe
1. Describe the Problem
As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

2. Design the Method Signature
Include the name of the method, its parameters, return value, and side effects.

```ruby

task_tracker = task_tracker(text)
# text is a string
# task_tracker should return a boolean depending on if text includes '#TODO'
```

# The method doesn't print anything or have any other side-effects

3. Create Examples as Tests
Make a list of examples of what the method will take and return.

task_tracker("") => false
task_tracker("#TODO Clean the dishes") => true
task_tracker("#TODO Wash the car") => true
task_tracker("Shop for groceries #TODO") => true
task_tracker("Eat breakfast") => false
task_tracker("Get out of bed") => false
task_tracker(nil) => error message
task_tracker(100) => error message

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.