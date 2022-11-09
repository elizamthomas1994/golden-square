{{PROBLEM}} Method Design Recipe

1. Describe the Problem
As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.
# 200 words per minute = (200 / 60) words per second = roughly 3 words per second

2. Design the Method Signature
Include the name of the method, its parameters, return value, and side effects.

```ruby
reading_time = reading_time_calculator(text)

# text takes a string of words
# reading_time is an integer representing words read per minute
```

3. Create Examples as Tests
Make a list of examples of what the method will take and return.

# EXAMPLE

# 1
reading_time_calculator("")
# => 0

# 2
reading_time_calculator("one")
# => 1

# 3
reading_time_calculator(TWO_HUNDRED_WORDS)
# => 2

# 4
reading_time_calculator(ONE_THOUSAND_WORDS)
# => 5

# 5
reading_time_calculator(TEN_THOUSAND_WORDS)
# => 50

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

