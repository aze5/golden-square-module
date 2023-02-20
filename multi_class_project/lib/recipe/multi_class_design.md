# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

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

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```

  ┌───────────────────────────────────┐   ┌────────────────────────────────┐
  │  Diary                            │   │ TodoList                       │
  │   - add(entry)                    │   │  - add(todo)                   │
  │   - all                           │   │  - tasks                       │
  │   - best_entry_for_reading_time   │   │     => [tasks...]              │
  │     => entry                      |   |                                | 
  |   - all_numbers                   |   |                                |
  |     => [num1...]                  │   │                                │
  └────────┬──────────────────────────┘   └────────────────────────────────┘
           │
           │ owns a list of
           │
           ▼
  ┌───────────────────────────────────┐
  │ DiaryEntry(title, contents)       │
  │  - title                          │
  │    => title                       │
  │  - contents                       │
  │    => contents                    │
  │  - count_words                    │
  │    => word count (int)            │
  └───────────────────────────────────┘

```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    # ...
  end

  def add(entry) # entry is an instance of DiaryEntry
    # entry gets add to the entries
    # Returns nothing
  end

  def all
    # Returns a list of DiaryEntry objects
  end
  
  def best_entry_for_reading_time(wpm, minutes) # both params are integers
    # wpm is the number of words user can read per minute
    # minutes is how much time the user has
    # Returns a DiaryEntry object that is closest but not over the amount of words the user can read in the specified time
  end

  def all_numbers
    # searches contents of all entries and finds phone numbers
    # returns a list of phone numbers
  end
end

class DiaryEntry
  def initialize(title, contents) # title and contents are both strings
  end

  def title
    # Returns title
  end

  def contents
    # returns contents
  end
  
  def count_words
    # returns number of words in contents
  end
end

class TodoList
  def initialize
    #...
  end

  def add(todo) # todo is a string
    # adds todo to list of tasks
    # returns nothing
  end

  def tasks
    # returns list of tasks
  end
```

## 3. Create Examples as Integration Tests

```ruby
# adds new entry
diary = Diary.new
entry = DiaryEntry.new("title", "contents")
diary.add(entry)
diary.all

# returns best entry for time
diary = Diary.new
entry = DiaryEntry.new("title", "contents " * 49 + "contents")
entry2 = DiaryEntry.new("title2", "contents " * 99 + "contents")
diary.add(entry)
diary.add(entry2)
diary.best_entry_for_reading_time(50, 1) # --> entry

# finds phone numbers in entries
diary = Diary.new
entry = DiaryEntry.new("title", "hello my name is ayoub, number is 07558-343796")
entry2 = DiaryEntry.new("title", "hello my name is jamie, number is 07858-343796")
diary.add(entry)
diary.add(entry2)
diary.all_numbers # --> ["07558-343796", "07858-343796"]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# todo adds a task
todo = Todo.new
todo.add("Walk dog")
todo.tasks # --> ["Walk dog"]

# DiaryEntry returns title
entry = DiaryEntry.new("Title", "contents")
entry.title # --> "Title"

# DiaryEntry returns contents 
entry = DiaryEntry.new("Title", "contents")
entry.contents # --> "contents"

# DiaryEntry returns word count
entry = DiaryEntry.new("Title", "contents")
entry.count_words # --> 1

```

