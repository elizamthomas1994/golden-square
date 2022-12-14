1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

2. Design the Class System

```ruby
class Diary
  def initialize
  end 

  def add(entry)
    # entry is an instance of DiaryEntry
    # Returns nothing
  end 

  def all
    # Returns a list of instances of DiaryEntry
  end 

  def reading_time(wpm) # wpm is an integer representing
    # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    # `wpm` is an integer representing the number of words the user can read
    # per minute.
    # `minutes` is an integer representing the number of minutes the user
    # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end

class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # entries is a string denoting diary entries
  end 

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end 

  def reading_time(wpm)
    # wpm is an integer representing
    # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end
end

class TodoList
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

class Todo
  def initalize(todo) 
    #todo is a string denoting item to be done
  end

  def todo
    #returns todo
  end
end

class ContactExtractor
  def initialize(diary) #diary represents diary object
  end

  def extract_numbers
    # iterates over diary entries and extracts contact numbers from them
  end
end
```

3. Create Examples as Integration Tests

```ruby
# Diary#all returns all entries in diary
diary = Diary.new
entry_1 = DiaryEntry.new('title', 'contents')
entry_2 = DiaryEntry.new('title2', 'contents2')
diary.add(entry_1)
diary.add(entry_2)
expect(diary.all).to eq([entry_1, entry_2])

# TodoList#all returns all todos in the list
todo_list = TodoList.new
todo_1 = Todo.new('Walk the dog')
todo_2 = Todo.new('Get dressed')
todo_list.add(todo_1)
todo_list.add(todo_2)
expect(todo_list.list).to eq([todo_1, todo_2])

# TodoList#complete removes todos from the list
todo_list = TodoList.new
todo_1 = Todo.new('Walk the dog')
todo_2 = Todo.new('Get dressed')
todo_list.add(todo_1)
todo_list.add(todo_2)
todo_list.complete(todo_1)
expect(todo_list.list).to eq([todo_2])

# TodoList#complete returns error if todo is not on list
todo_list = TodoList.new
todo_1 = Todo.new('Walk the dog')
todo_2 = Todo.new('Get dressed')
todo_list.add(todo_1)
todo_list.add(todo_2)
expect{ todo_list.complete("Shop for groceries") }.to raise_error "Todo not recognised"

# Diary#reading_time returns a whole number integer for total reading time of the diary
diary = Diary.new
entry_1 = DiaryEntry.new('title', 'contents ' * 200)
entry_2 = DiaryEntry.new('title2', 'contents ' * 400)
diary.add(entry_1)
diary.add(entry_2)
expect(diary.reading_time(100)).to eq 6

# Diary#reading_time returns a rounded up estimation for total reading time of the diary
diary = Diary.new
entry_1 = DiaryEntry.new('title', 'contents ' * 10)
entry_2 = DiaryEntry.new('title2', 'contents ' * 5)
diary.add(entry_1)
diary.add(entry_2)
expect(diary.reading_time(2)).to eq 8

# Diary#reading_time returns an error if wpm = 0
diary = Diary.new
entry_1 = DiaryEntry.new('title', 'contents ' * 200)
entry_2 = DiaryEntry.new('title2', 'contents ' * 400)
diary.add(entry_1)
diary.add(entry_2)
expect{ diary.reading_time(0) }.to raise_error "WPM must be positive."

# Diary#find_best_entry_for_reading_time returns the longest entry the user can read with the given minutes and wpm
diary = Diary.new
entry_1 = DiaryEntry.new('title', 'contents ' * 200)
entry_2 = DiaryEntry.new('title2', 'contents2 ' * 400)
diary.add(entry_1)
diary.add(entry_2)
expect(diary.find_best_entry_for_reading_time(200,2)).to eq(entry_2)

# ContractExtractor#diary_searcher returns all contact numbers within diary entries
diary = Diary.new 
entry_1 = DiaryEntry.new('title1', 'I rang 07123456345')
entry_2 = DiaryEntry.new('title2', 'the number 07234234234 called me')
entry_3 = DiaryEntry.new('title3', '07555444333 texted her')
Diary.add(entry_1)
Diary.add(entry_2)
Diary.add(entry_3)
contact_list = ContactExtractor.new(diary)
expect(contact_list.extract_numbers).to eq[
  '07123456345'
  '07234234234'
  '07555444333'
]

# ContractExtractor#diary_searcher returns empty array when called on an empty diary
diary = Diary.new 
contact_list = ContactExtractor.new(diary) 
expect(contact_list.extract_numbers).to eq []

```
4. Create Examples as Unit Tests

```ruby 

# DiaryEntry#count_words returns 0 if entry is empty
entry_1 = DiaryEntry.new('title', '')
expect(entry_1.count_words).to eq(0)

# DiaryEntry#count_words returns 10 if entry contains 10 words
entry_1 = DiaryEntry.new('title', 'hello ' * 10)
expect(entry_1.count_words).to eq(10)

# Todo initialises an instance of Todo
expect(Todo.new('Walk the dog')).to be_an_instance_of(Todo)

# Todo#todo returns the todo
todo_1 = Todo.new('Walk the dog')
expect(todo_1.todo).to eq('Walk the dog')

# Diary#all returns an empty list when no entries added
diary = Diary.new 
expect(diary.all).to eq([])

# TodoList#all returns an empty list when no todos added
todo_list = TodoList.new 
expect(todo_list.list).to eq([])
```

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.