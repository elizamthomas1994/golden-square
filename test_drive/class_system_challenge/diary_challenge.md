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
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com
```ruby
class Diary
  def initialize
  end 
  def add(entry)
  end 
  def all
  end 
  def find_best_entry_for_reading_time(wpm, minutes)
  end
  def find_contacts_in_entries(contacts)
  end
end

class DiaryEntry
  def initialize(title, contents)
  end # entries is a string denoting diary entries
  def count_words
  end 
  def reading_time(wpm)
  end
end

class TodoList
  def initialize
  end
  def add(todo)
  end # todo is an instance of Todo
  def 
  def all
  end
end

class Todo
  attr_accessor :task
  def initalize(task) #task is a string denoting item to be done
  @task = task
  end
end

class ContactList(contacts) # contacts is a string denoting mobile phone numbers
  def initialize
  end

  def add(contacts)
  end

  def list
  end
end

class Contact
  def initialize(name, number)
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
expect(todo_list.all).to eq([todo_1, todo_2])

# Contacts#all returns all contacts in the list
contact_list = ContactList.new
contact_1 = Contact.new('Bob', 999)
contact_2 = Contact.new('Jim', 111)
contact_list.add(contact_1)
contact_list.add(contact_2)
expect(contact_list.list).to eq([contact_1, contact_2])

# Diary#find_best_entry_for_reading_time returns the longest entry the user can read with the given minutes and wpm
diary = Diary.new
entry_1 = DiaryEntry.new('title', 'contents ' * 200)
entry_2 = DiaryEntry.new('title2', 'contents2 ' * 400)
diary.add(entry_1)
diary.add(entry_2)
expect(diary.find_best_entry_for_reading_time(200,2)).to eq(entry_2)

# Diary#find_contacts_in_entries
diary = Diary.new 
entry_1 = DiaryEntry.new('title1','random stuff 999')
entry_2 = DiaryEntry.new('title2','words')
entry_3 = DiaryEntry.new('title3','random 111 words')
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
contacts_list = ContactList.new 
contact_1 = Contact.new('Bob', 999)
contact_2 = Contact.new('Jim' 111)
contacts_list.add(contact_1)
contacts_list.add(contact_2)
expected = [contact_1, contact_2]
expect(diary.find_contacts_in_entries(contacts_list)).to eq(expected)

# Diary#find_contacts_in_entries returns error when called on an empty diary
diary = Diary.new 
contact_list = ContactList.new 
contact = Contact.new('Jim', 999)
contact_list.add(contact)
expect{ diary.find_contacts_in_entries(contact_list) }.to raise_error('Diary is empty')
```

4. Create Examples as Unit Tests
```ruby 

# DiaryEntry#count_words returns 0 if entry is empty
entry_1 = DiaryEntry.new('title', '')
expect(entry_1.count_words).to eq(0)

# DiaryEntry#count_words returns 10 if entry contains 10 words
entry_1 = DiaryEntry.new('title', 'hello ' * 10)
expect(entry_1.count_words).to eq(10)

# DiaryEntry#reading_time returns the num of minutes as an integer that it'll take the user to read the diary entry at a given wpm
entry_1 = DiaryEntry.new('title', 'word ' * 200)
expect(entry_1.reading_time(100)).to eq(2)

# DiaryEntry#reading_time returns the num of minutes as an integer that it'll take the user to read the diary entry at a given wpm
entry_1 = DiaryEntry.new('title', 'word ' * 430)
expect(entry_1.reading_time(100)).to eq(5)

# DiaryEntry#reading_time returns an error when wpm <= 0
entry_1 = DiaryEntry.new('title', 'word ' * 430)
expect{ entry_1.reading_time(0) }.to raise_error('WPM must be positive')

# Todo initialises an instance of Todo
expect(Todo.new('Walk the dog')).to be_an_instance_of(Todo)

# Todo#task returns the todo
todo_1 = Todo.new('Walk the dog')
expect(todo_1.task).to eq('Walk the dog')

# Contact#name returns the name of the contact
contact_1 = Contact.new('Jim', 999)
expect(contact_1.name).to eq('Jim')

# Contact#number returns the number of the contact
contact_1 = Contact.new('Jim', 999)
expect(contact_1.number).to eq(999)

# Diary#all returns an empty list when no entries added
diary = Diary.new 
expect(diary.all).to eq([])

# Diary#find_best_entry_for_reading_time returns error when called on an empty diary
diary = Diary.new 
expect{ diary.find_best_entry_for_reading_time(200, 5) }.to raise_error('Diary is empty')

# TodoList#all returns an empty list when no todos added
todo_list = TodoList.new 
expect(todo_list.all).to eq([])

# ContactList#list returns an empty list when no todos added
contacts = ContactList.new 
expect(contacts.list).to eq([])

```

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.