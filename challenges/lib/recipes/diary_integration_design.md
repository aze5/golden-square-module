#  Diary Classes Design Recipe

## 1. The Problem

Test drive a class system based on the class interface design below.

## 2. Class Interface Design

```ruby

class Diary
  def initialize
  # ...
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
  end

  def all
    # Returns a list of instances of DiaryEntry
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
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

# File: lib/diary_entry.rb
class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
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

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end
```

## 3. Examples as Tests

```ruby

# 1 
diary = Diary.new
diary_entry = DiaryEntry.new("07/11/19", "contents")
diary.add(diary_entry)
expect(diary.all).to eq [diary_entry]

# 2
diary = Diary.new
diary_entry = DiaryEntry.new("07/11/19", "contents")
diary_entry2 = DiaryEntry.new("11/02/20", "more contents")
diary.add(diary_entry)
diary.add(diary_entry2)
diary.all # --> [diary_entry, diary_entry2]
diary.reading_time(50) # --> 2

# 3
diary = Diary.new
diary_entry = DiaryEntry.new("07/11/19", "contents")
diary_entry2 = DiaryEntry.new("11/02/20", "contents " * 50)
diary_entry3 = DiaryEntry.new("17/06/20", "contents " * 100)
diary.add(diary_entry)
diary.add(diary_entry2)
diary.add(diary_entry3)
diary.reading_time(50) # --> 3

# 4
diary = Diary.new
diary_entry = DiaryEntry.new("07/11/19", "contents")
diary_entry2 = DiaryEntry.new("11/02/20", "contents " * 50)
diary_entry3 = DiaryEntry.new("17/06/20", "contents " * 100)
diary.add(diary_entry)
diary.add(diary_entry2)
diary.add(diary_entry3)
diary.find_best_entry_for_reading_time(50, 1) # --> "11/02/20"

# 5
diary = Diary.new
diary_entry = DiaryEntry.new("07/11/19", "contents")
diary_entry2 = DiaryEntry.new("11/02/20", "contents " * 50 + "words " * 50)
diary_entry3 = DiaryEntry.new("17/06/20", "contents " * 100)
diary.add(diary_entry)
diary.add(diary_entry2)
diary.add(diary_entry3)
diary_entry2.reading_chunk(50, 1) # --> "contents " * 50
diary_entry2.reading_chunk(50, 1) # --> "words " * 50
diary_entry3.reading_time(50) # --> 2


```

_Encode each example as a test. You can add to the above list as you go._
