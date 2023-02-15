#  reading_time Method Design Recipe

## 1. Describe the Problem

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

reading_time method will have one paramater called words
it will contain a variable called words_length that contains the number of words in the 'words' string
it will return the number of minutes it will take to read the 'words' string in the following format: '60 minutes'

```ruby
# reading_time returns the time it takes to read a string:
words = "a string"
# words_length contains the number of words in 'words'
words_length = words.split.length
```

## 3. Create Examples as Tests

```ruby
# EXAMPLE OUTPUT:
puts reading_time("hi " * 12000)
--> "60 minutes"
puts reading_time("hi " * 100)
--> "less than one minute"
```

## 4. Implement the Behaviour
