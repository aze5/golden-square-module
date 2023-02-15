# grammar_checker Method Design Recipe

## 1. Describe the Problem
As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature
#### method name and variables:
- grammar_checker(text)
- punctuation array

```ruby
# EXAMPLE

# grammar_checker checks a string to ensure the first character is uppercase, and the last character is a suitible sentence ending punctuation mark

punctuation: an array (eg ['.', '!', '?']
text: a string (e.g. "Hello WORLD!")

# The method prints "Good grammar!" if text passes the checks or, "Your grammar is incorrect." otherwise. if passed an empty string, the method will return "ERROR, your text is empty"
```

## 3. Examples as Tests



```ruby
# EXAMPLE

grammar_checker("hello WORLD") => "Your grammar is incorrect."
grammar_checker("Hello world") => "Your grammar is incorrect."
grammar_checker("hello world.") => "Your grammar is incorrect."
grammar_checker("hello WoRLD!") => "Your grammar is incorrect."
grammar_checker("Hello WORLD!") => "Good grammar!"
grammar_checker("") => "ERROR, your text is empty"
grammar_checker(nil) throws an error
```


