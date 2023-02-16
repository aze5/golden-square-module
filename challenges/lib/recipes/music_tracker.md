# {{PROBLEM}} Class Design Recipe

## 1. The Problem

As a user, so that I can keep track of my music listening, I want to add tracks I've listened to and see a list of them.


## 2. Class Interface Design

```ruby
# EXAMPLE

class MusicTracker
  def initialize
    # ...
  end

  def add(song) # song is a string
    # adds song to array
    # No return value
  end

  def remove(song) # song is a string
    # fails if songs array is empty
    # remove song from songs array
    # No return value
  end

  def view
    # return a list of songs
  end
end
```

## 3. Examples as Tests

```ruby
# EXAMPLE

# 1
songs = MusicTracker.new
songs.add("song name")
song.view # => ["song name"]

# 2
songs = MusicTracker.new
songs.add("song name")
songs.remove("song name")
song.view # => []

# 3
songs = MusicTracker.new
songs.remove("") # fails with "No such song"
```