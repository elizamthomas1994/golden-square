1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

2. Design the Class Interface
```ruby
class MusicTracker
  def initialize
  end

  def add(track) # track is a string that represents song listened to
    # adds track to list
    # returns nothing
    # fails if track is not a string
  end

  def list
    # returns list of tracks
  end
end
```
3. Create Examples as Tests
```ruby
# 1
music_tracker = MusicTracker.new
music_tracker.list # => []

# 2
music_tracker = MusicTracker.new
music_tracker.add("Welcome To The Jungle")
music_tracker.list # => ["Welcome To The Jungle"]

# 3
music_tracker = MusicTracker.new
music_tracker.add("Welcome To The Jungle")
music_tracker.add("Master of Puppets")
music_tracker.list # => ["Welcome To The Jungle", "Master of Puppets"]

# 4
music_tracker = MusicTracker.new
music_tracker.add(100) # fails "Invalid track name"
```

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.