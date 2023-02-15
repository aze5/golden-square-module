

# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user,
So that I can keep track of my tasks,
I want to check if a text includes the string #TODO.

## 2. Method Signature

includes_string(text) will split a string into an array and use the array#include? method to check if the pattern is included in text

method name:
includes_string(text)

paramater(s):

- text - a string to search and find the pattern 

variable(s):

- pattern - the pattern to search for (in this case '#TODO')
- word_array - the array in which each word in 'text' will be kept
- index - the index of the pattern (if found)

Output:
If pattern is found: "#{pattern} found at index: #{index}"

If pattern is not found: "#{pattern} not found"

## 3. Examples as Tests


```ruby
# EXAMPLE

includes_string("hello WORLD") => "#TODO not found"
includes_string("") => "#TODO not found"
includes_string("HELLO WORLD#TODO") => "#TODO found at index: 11"
includes_string("hello world #TODO") => "#TODO found at index: 12"
includes_string("hello #TODO WoRLD") => "#TODO found at index: 6"
includes_string("#TODOhello WORLD!") => "#TODO found at index: 0"
includes_string(nil) throws an error
```