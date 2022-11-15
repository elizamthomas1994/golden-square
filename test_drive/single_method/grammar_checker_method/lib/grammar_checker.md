
{{PROBLEM}} Method Design Recipe
1. Describe the Problem

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

2. Design the Method Signature
Include the name of the method, its parameters, return value, and side effects.

```ruby 
grammar_check = grammar_checker(text)

# text takes a string of words
# returns boolean if text begins with capital and ends with relevant punctuation or not.
```

3. Create Examples as Tests
Make a list of examples of what the method will take and return.

# EXAMPLE

# 1
grammar_checker("")
# => error (Not a sentence.)

# 2 
grammar_checker("hello, world")
# => false

# 3
grammar_checker("Hello, world.")
# => true

# 4
grammar_checker("Hello, world!")
# => true

# 5
grammar_checker("Hello, world")
# => false

# 6
grammar_checker("hello, world.")
# => false

# 7
grammar_checker("Hello, world?")
# => true

Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.